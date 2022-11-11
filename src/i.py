import datetime
import subprocess
from urllib import request
import urllib
import base64
from wsgiref import headers
from bs4 import BeautifulSoup
import requests
from requests.auth import HTTPBasicAuth
import os
import glob
import shutil
import time
from psycopg2.extras import DictCursor
import psycopg2

def execute_command(command):
    proc = subprocess.Popen(
        command,
        shell=True,  # シェル経由($ sh -c "command")で実行。
        stdin=subprocess.PIPE,  # 1
        stdout=subprocess.PIPE,  # 2
        stderr=subprocess.PIPE,
    )  # 3
    return proc.communicate()  # 処理実行を待つ(†1)

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

def cleanup_dir(path,wild_card):
    for filename in  glob.glob(path+wild_card):
        if os.path.exists(path=filename):
            os.remove(filename)

def move(path,wild_card,to_dir_path):
    for filename in  glob.glob(path+wild_card):
        if os.path.exists(path=filename):
            shutil.move(filename, to_dir_path)


def get_zip_urls(base_url):
    # Basic認証の情報
    user = '22027075'
    password = '21224577'

    # Basic認証用の文字列を作成.
    basic_user_and_pasword = base64.b64encode('{}:{}'.format(user, password).encode('utf-8'))
    basic_auth = {"Authorization": "Basic " + basic_user_and_pasword.decode('utf-8')}
    req = urllib.request.Request(base_url,headers=basic_auth)

    response = request.urlopen(req)
    content = response.read()
    html = content.decode("shift-jis")
    response.close()
    soup = BeautifulSoup(html, 'html.parser')

    zip_urls = []
    for link in soup.find_all("a"):
        url = link["href"]
        if url.endswith(".zip"):
            # print(f"{base_url}{url}")
            zip_urls.append(f"{base_url}{url}")
    return zip_urls

def download_zip(zip_url,file_type,current_year):
    user = '22027075'
    password = '21224577'
    file_name = zip_url.split("/")[-1]
    # 当年のデータは全部ダウンロード
    fileYear = "20" + zip_url.split("/")[-1][3:5]
    
    if (not os.path.exists(path=f"./zip/{file_type}/{file_name}")) or fileYear == current_year:
        # Chaは年度別データが無いので全部DL
        if file_type != "Cha" and not (file_name.startswith(f"{file_type.upper()}{current_year[2:4]}") or file_name.startswith(f"{file_type.upper()}_")):
            print("対象外データです", file_name)
            return
        print("Downloading:", zip_url)
        urlData = requests.get(zip_url,auth=HTTPBasicAuth(user, password)).content
        with open(f"./zip/{file_type}/{file_name}" ,mode='wb') as f:
            f.write(urlData)

    shutil.copy(f"./zip/{file_type}/{file_name}","./tmp/")

def cleanup():
    cleanup_dir('./test_input/',"*")
    cleanup_dir('./tmp/',"*")

def insert_data_to_db(file_type, file_encode, isSchedule):
    subprocess.run(['unzip','./tmp/*.zip','-d','./tmp/'])
    cleanup_dir('./tmp/',"SRB*.txt")
    cleanup_dir('./tmp/',"*_t.txt")
    move("./tmp/","*.txt", "./test_input/")
    cleanup_dir('./tmp/',"*.zip")
    subprocess.call(f'echo "{str(file_type).lower()}\n{file_encode}\n{isSchedule}\n" | python3 main.py',shell=True)

def main():
    load_contents = [
        # 直前情報
        {"file_type": "Tyb", "file_encode": "shift-jis", "is_schedule": "false"},
        # 調教情報
        {"file_type": "Cha", "file_encode": "cp932", "is_schedule": "false"},
        {"file_type": "Cyb", "file_encode": "cp932", "is_schedule": "false"},
        # 開催データ(天候等)
        {"file_type": "Kab", "file_encode": "cp932", "is_schedule": "true"},
        # 競走馬データ
        {"file_type": "Kyi", "file_encode": "cp932", "is_schedule": "false"},
        # 成績データ(レースペース等)
        {"file_type": "Sed", "file_encode": "cp932", "is_schedule": "false"},
    ]
    current_year = datetime.datetime.now().year
    with get_connection() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            for contents in load_contents:
                    print("delete data.")
                    print(f"delete from public.jrdb_{contents['file_type'].lower()};")
                    cur.execute(f"delete from public.jrdb_{contents['file_type'].lower()};")

    for contents in load_contents:
        cleanup()
        zip_urls = get_zip_urls(f'http://www.jrdb.com/member/datazip/{contents["file_type"]}/')
        for url in zip_urls:
            # url = "http://www.jrdb.com/member/datazip/Tyb/TYB_2006.zip"
            download_zip(url, contents["file_type"], f"{current_year}")
        insert_data_to_db(contents["file_type"], contents["file_encode"],contents["is_schedule"])

main()
# html = content.decode("shift-jis")