from ast import Pass
import re
import csv
import json
import sys
import numpy as np
def read_file(path):
    try:
        with open(path, "r", encoding='utf-8') as f:
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

def save_file(path, text):
    with open(path, mode="w") as f:
        f.write(text)

def validate(path, data):
    index = 1
    for column in data:
        if column["name"] == "":
            print(f"--------------------------{path}-----------------------------")
            print("name", column["name"])
            exit(0)
        if not column["byte"].isdigit():
            print(f"--------------------------{path}-----------------------------")
            print("byte",column["byte"],"name", column["name"])
            exit(0)
        if not column["ref_index"].isdigit():
            print(f"--------------------------{path}-----------------------------")
            print("ref_index",column["ref_index"],"name", column["name"])
            exit(0)
        if index != int(column["ref_index"]):
            print(f"--------------------------{path}-----------------------------")
            print(index, column["ref_index"])
            exit(0)
        index = index + int(column["byte"])

def main():
    spec = sys.argv[1]
    text = read_file(f"./spec_csv/{spec}.csv")
    validate(spec, text)
    save_file(f"./spec_json/{spec}.json", json.dumps(text, indent=2, ensure_ascii=False))

main()