#!/bin/bash
rm ./test_input/*
rm ./tmp/*
cd tmp

# 両方持ってきて
# ↓cp932にしてね
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Kab/2022/KAB220529.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Kyi/2022/KYI220529.zip
wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/2022/TYB220528.zip
unzip *.zip
rm SRB*.txt
rm *_t.txt
mv *.txt ../test_input/
rm *.zip
cd ../
python3 main.py

# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220409.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220403.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220402.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220327.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220326.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220321.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220320.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220319.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220313.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220312.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220306.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220305.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220227.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220226.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220220.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220219.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220213.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220212.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220206.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220205.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220130.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220129.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220123.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220122.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220116.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220115.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220110.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220109.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220108.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220105.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2021.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2020.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2019.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2018.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2017.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2016.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2015.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2014.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2013.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2012.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2011.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2010.zip
# unzip *.zip
# rm SRB*.txt
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip


# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2021.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2020.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2019.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2018.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2017.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2016.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2015.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2014.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2013.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2012.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2011.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Tyb/TYB_2010.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220402.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220327.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220326.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220321.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220320.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220319.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220313.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220312.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220306.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220305.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220227.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220226.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220220.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220219.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220213.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220212.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220206.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220205.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220130.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220129.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220123.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220122.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220116.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220115.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220110.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220109.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220108.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip
# wget --http-user=22027075 --http-passwd=21224577  http://www.jrdb.com/member/datazip/Tyb/2022/TYB220105.zip
# unzip *.zip
# rm *_t.txt
# mv *.txt ../test_input/
# rm *.zip


