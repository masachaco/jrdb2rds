#!/bin/bash
rm ./test_input/*
rm ./tmp/*
cd tmp

# 両方持ってきて
# ↓cp932にしてね
wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Kab/20$KAISAI_NEN/KAB$KAISAI_NEN$KAISAI_MONTH$KAISAI_DAY.zip
unzip *.zip
rm SRB*.txt
rm *_t.txt
mv *.txt ../test_input/
rm *.zip
cd ../
echo "kab\ncp932\ntrue\n" | python3 main.py

rm ./test_input/*
rm ./tmp/*
cd tmp
wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Kyi/20$KAISAI_NEN/KYI$KAISAI_NEN$KAISAI_MONTH$KAISAI_DAY.zip
unzip *.zip
rm SRB*.txt
rm *_t.txt
mv *.txt ../test_input/
rm *.zip
cd ../
echo "kyi\ncp932\nfalse\n" | python3 main.py
