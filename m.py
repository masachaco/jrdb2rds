import sys
from psycopg2.extras import DictCursor
import psycopg2
import subprocess
import model.parse as ps
import json,csv,os

def read_file(path,encode):
    try:
        with open(path, "r", encoding=encode) as f:
            if path.endswith('.csv'):
                json_list = []
                for row in csv.DictReader(f):
                    json_list.append(row)
                return json_list
            return f.read()
    except FileNotFoundError as e: # FileNotFoundErrorは例外クラス名
        print("ファイルが見つかりません", e)
    except Exception as e: # Exceptionは、それ以外の例外が発生した場合
        print(e)


def get_connection():
    # DBの接続先IPが毎回変わるので取得する
    db_host, stderr_data = execute_command(
        "ip route | grep 'default via' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
    )
    print(db_host.decode().replace("\n", ""))
    db_url = (
        "postgresql://postgres:keibadb@"
        + db_host.decode().replace("\n", "")
        + ":5432/pckeiba"
    )
    return psycopg2.connect(db_url)

def execute_command(command):
    proc = subprocess.Popen(
        command,
        shell=True,  # シェル経由($ sh -c "command")で実行。
        stdin=subprocess.PIPE,  # 1
        stdout=subprocess.PIPE,  # 2
        stderr=subprocess.PIPE,
    )  # 3
    return proc.communicate()  # 処理実行を待つ(†1)

def get_race_schedule(cur):
    cur.execute(
        f"select * from public.jvd_ys where cast(kaisai_nen as integer) >= 2000;"
    )
    schedules = cur.fetchall()
    result = {}
    for schedule in schedules:
        result[f'{schedule["keibajo_code"]}-{schedule["kaisai_nen"][2:4]}-{str(int(schedule["kaisai_kai"]))}-{str(int(schedule["kaisai_nichime"]))}'] = {
            "kaisai_nen": schedule["kaisai_nen"],
            "kaisai_tsuki": schedule["kaisai_tsukihi"][0:2],
            "kaisai_hi": schedule["kaisai_tsukihi"][2:4],
        }
    return result

def main():
    files = os.listdir("./test_input")
    # model_type = "tyb"
    # encode = "cp932"
    model_type = input()
    encode = input()
    # レース単位ではなく、開催単位のデータの場合はtrue。レース単位の場合はfalse。
    isSchedule = True if input() == "true" else False
    with get_connection() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            schedules = get_race_schedule(cur)
            ps.create_table(cur, model_type, isSchedule)
            data = []
            for file in files:
                print("file:",file)
                data.extend(ps.parse(f"./test_input/{file}", model_type, encode))   

                # 5000件ずつinsert
                if len(data) >= 5000:
                    ps.insert_data(cur, data, model_type, isSchedule, schedules)
                    data.clear()

            # 残件を追加
            if len(data) > 0:
                ps.insert_data(cur, data, model_type, isSchedule, schedules)
                
main()