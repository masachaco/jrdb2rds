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

def execute_command(command):
    proc = subprocess.Popen(
        command,
        shell=True,  # シェル経由($ sh -c "command")で実行。
        stdin=subprocess.PIPE,  # 1
        stdout=subprocess.PIPE,  # 2
        stderr=subprocess.PIPE,
    )  # 3
    return proc.communicate()  # 処理実行を待つ(†1)
def get_basepath():
    base_path, stderr_data = execute_command(
        "cd ~/;pwd"
    )
    base_path = str(base_path.decode()).replace("\n", "").strip()
    return base_path
    
BASE_PATH=get_basepath()
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
            print(f"{base_url}{url}")
            zip_urls.append(f"{base_url}{url}")
    return zip_urls

def download_zip(zip_url,file_type,current_year):
    user = '22027075'
    password = '21224577'
    file_name = zip_url.split("/")[-1]
    if not os.path.exists(path=f"{BASE_PATH}/Projects/keiba-util4/jrdb2rds/zip/{file_type}/{file_name}"):
        if not (file_name.startswith(f"{file_type.upper()}{current_year[2:4]}") or file_name.startswith(f"{file_type.upper()}_")):
            print("対象外データです", file_name)
            return
        print("Downloading:", zip_url)
        urlData = requests.get(zip_url,auth=HTTPBasicAuth(user, password)).content
        with open(f"{BASE_PATH}/Projects/keiba-util4/jrdb2rds/zip/{file_type}/{file_name}" ,mode='wb') as f:
            f.write(urlData)

    shutil.copy(f"{BASE_PATH}/Projects/keiba-util4/jrdb2rds/zip/{file_type}/{file_name}",f"{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/")

def cleanup():
    cleanup_dir(f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/test_input/',"*")
    cleanup_dir(f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/',"*")

def insert_data_to_db(file_type, file_encode, isSchedule):
    subprocess.run(['unzip',f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/*.zip','-d',f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/'])
    cleanup_dir(f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/',"SRB*.txt")
    cleanup_dir(f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/',"*_t.txt")
    move(f"{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/","*.txt", f"{BASE_PATH}/Projects/keiba-util4/jrdb2rds/test_input/")
    cleanup_dir(f'{BASE_PATH}/Projects/keiba-util4/jrdb2rds/tmp/',"*.zip")
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
        {"file_type": "Kyi", "file_encode": "cp932", "is_schedule": "false"}
    ]
    for contents in load_contents:
        cleanup()
        zip_urls = get_zip_urls(f'http://www.jrdb.com/member/datazip/{contents["file_type"]}/')
        for url in zip_urls:
            # url = "http://www.jrdb.com/member/datazip/Tyb/TYB_2006.zip"
            download_zip(url, contents["file_type"], "2022")
        insert_data_to_db(contents["file_type"], contents["file_encode"],contents["is_schedule"])

main()
# html = content.decode("shift-jis")