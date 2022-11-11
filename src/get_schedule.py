import subprocess
import psycopg2
from psycopg2.extras import DictCursor
import sys
from datetime import datetime
import json
import yaml
import argparse

CONFIG = {}


def load_config(config_file_path):
    with open(config_file_path, "r") as yml:
        return yaml.safe_load(yml)


def execute_command(command):
    proc = subprocess.Popen(
        command,
        shell=True,  # シェル経由($ sh -c "command")で実行。
        stdin=subprocess.PIPE,  # 1
        stdout=subprocess.PIPE,  # 2
        stderr=subprocess.PIPE,
    )  # 3
    return proc.communicate()  # 処理実行を待つ(†1)


def get_host():
    host = "10.174.0.2"
    return "localhost"
    os_distri, stderr_data = execute_command(
        " more /etc/os-release|grep Ubuntu -o |uniq"
    )
    os_distri = str(os_distri.decode()).replace("\n", "").strip()
    if os_distri.strip() == "Ubuntu":
        db_host, stderr_data = execute_command(
            "ip route | grep 'default via' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
        )
        host = db_host.decode().replace("\n", "")
    return host

def get_connection():
    # DBの接続先IPが毎回変わるので取得する
    host = get_host()
    db_url = (
        "postgresql://postgres:keibadb@"
        + host
        + ":5432/pckeiba"
    )
    return psycopg2.connect(db_url)

def get_race_schedule(cur):
    cur.execute(
        f"select * from public.jvd_ys where cast(kaisai_nen as integer) >= 2000;"
    )
    return cur.fetchall()


def main(cur):

    schedules = get_race_schedule(cur)
    result = {}
    for schedule in schedules:
        result[f'{schedule["keibajo_code"]}-{schedule["kaisai_nen"][2:4]}-{str(int(schedule["kaisai_kai"]))}-{str(int(schedule["kaisai_nichime"]))}'] = {
            "kaisai_nen": schedule["kaisai_nen"],
            "kaisai_tsuki": schedule["kaisai_tsukihi"][0:2],
            "kaisai_hi": schedule["kaisai_tsukihi"][2:4],
        }
    print(json.dumps(result, ensure_ascii=False))


if __name__ == "__main__":
    with get_connection() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            main(cur)
