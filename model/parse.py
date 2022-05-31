import unicodedata
from ast import Pass
import json, csv

from regex import P


def read_file(path,encode=None):
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


def parse(load_file_path, model_name):
    print(load_file_path)
    data = read_file(load_file_path, "shift-jis").split("\n")
    model = json.loads(read_file(f"./spec_json/{model_name}.json"))
    result = []
    for load_record in data:
        if load_record == "":
            continue
        record = {}
        result.append(record)
        byte_record = bytearray(load_record, "shift-jis")
        for col in model:
            index = int(col["ref_index"]) -1
            byte = int(col['byte'])
            record[col['name']] = byte_record[index: index + byte].decode("shift-jis")

    return result

def create_table(cur, model_name):
    model = json.loads(read_file(f"./spec_json/{model_name}.json"))
    cols = []
    for col in model:
        cols.append(f"{col['name']} char({col['byte']})")
    
    sql = f'''
        create table if not exists 
            public.jrdb_{model_name} 
            (
                keibajo_code character varying(2),
                kaisai_nen character varying(4),
                kaisai_tsukihi character varying(4),
                race_bango character varying(2),
                umaban character varying(2),
                {",".join(cols)}
            )
    '''
    cur.execute(sql)

def insert_data(cur, load_data, model_name):
    schedules = json.loads(read_file("./resource/schedule.json", "utf-8"))
    model = json.loads(read_file(f"./spec_json/{model_name}.json"))
    col_names = []
    
    for col in model:
        col_names.append(col['name'])
    
    insert_data = []
    counter=0
    for data in load_data:
        day = int("0x"+data["日"],0)
        year = int(data["年"])
        kai = int(data["回"])
        schedule_id = f'{data["場コード"]}-{year}-{kai}-{day}'
        if schedule_id not in schedules:
            print("SkipSchedule",schedule_id)
            continue

        schedule = schedules[schedule_id]
        if counter==0:
            kaisai_nen = schedule["kaisai_nen"]
            kaisai_tsukihi = schedule["kaisai_tsuki"] + schedule["kaisai_hi"]
            print("削除tyb:", kaisai_nen, kaisai_tsukihi)
            cur.execute(f"DELETE FROM public.jrdb_{model_name} WHERE kaisai_nen = '{kaisai_nen}' and kaisai_tsukihi = '{kaisai_tsukihi}'")
        counter=counter+1
        records = [
            "'" + data["場コード"] + "'",
            "'" + schedule["kaisai_nen"] + "'",
            "'" + schedule["kaisai_tsuki"] + schedule["kaisai_hi"] + "'",
            "'" + data["Ｒ"] + "'",
            "'" + data["馬番"] + "'",
        ]
        for name in col_names:
            records.append("'" + data[name] + "'")
        insert_data.append("(" + ",".join(records) + ")")
    
    sql = f'''
        INSERT INTO 
            public.jrdb_{model_name}
                (
                    keibajo_code,
                    kaisai_nen,
                    kaisai_tsukihi,
                    race_bango,
                    umaban,
                    {','.join(col_names)}
                )
            VALUES
                {','.join(insert_data)}
    '''
    cur.execute(sql)