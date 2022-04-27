import re
import csv
import sys

def read_file(path):
    try:
        with open(path, "r", encoding='shift-jis') as f:
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

def main():
    spec = sys.argv[1]
    print(spec)
    file_name = f"{spec}.txt"
    text = read_file(f"./spec/{file_name}")
    text = text.replace("\n","@")
    text = text.replace("@@","@")
    text = re.sub(".*\*@項目名","", text)
    splitted_text = text.split("@")
    splitted_text.pop(0)
    splitted_text.pop(0)
    text = "@".join(splitted_text)
    text = re.sub("\*\*.*","", text)
    text = re.sub("^\n","", text)
    text = re.sub("@","\n", text)
    save_file(f"./trimed_spec/{file_name}", text)

main()