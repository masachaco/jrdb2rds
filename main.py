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


def main():
    files = os.listdir("./test_input")
    model_type = "tyb"
    data = []
    for file in files:
        print(file)
        data.extend(ps.parse(f"./test_input/{file}", model_type))

    print("data loaded.")
    with get_connection() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            ps.create_table(cur, model_type)
            ps.insert_data(cur, data, model_type)
main()