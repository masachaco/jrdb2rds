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


def get_host():
    host = "10.174.0.2"
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

def get_engine():

    host = get_host()
    connection_config = {
        'user': 'postgres',
        'password': 'keibadb',
        'host': host,
        'port': 5432,
        'database': 'pckeiba'
    }
    print(connection_config)
    return create_engine('postgresql://{user}:{password}@{host}:{port}/{database}'.format(**connection_config))


def execute_command(command):
    proc = subprocess.Popen(
        command,
        shell=True,  # シェル経由($ sh -c "command")で実行。
        stdin=subprocess.PIPE,  # 1
        stdout=subprocess.PIPE,  # 2
        stderr=subprocess.PIPE,
    )  # 3
    return proc.communicate()  # 処理実行を待つ(†1)


def main():
    files = os.listdir("./test_input")
    # model_type = "tyb"
    # encode = "cp932"
    model_type = input()
    encode = input()
    # レース単位ではなく、開催単位のデータの場合はtrue。レース単位の場合はfalse。
    isSchedule = True if input() == "true" else False
    
    data = []
    for file in files:
        print("file:",file)
        data.extend(ps.parse(f"./test_input/{file}", model_type, encode))

    with get_connection() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            ps.create_table(cur, model_type, isSchedule)
            ps.insert_data(cur, data, model_type, isSchedule)
main()