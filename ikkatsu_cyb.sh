#!/bin/bash

rm ./test_input/*
rm ./tmp/*
cd tmp

wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Cha/2008/CHA081018.zip

unzip "*.zip"
rm SRB*.txt
rm *_t.txt
mv *.txt ../test_input/
rm *.zip
cd ../
echo "cha\ncp932\nfalse\n" | python3 main.py

# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220702.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220626.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220625.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220619.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220618.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220612.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220611.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220605.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220604.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220529.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220528.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220522.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220521.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220515.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220514.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220508.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220507.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220501.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220430.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220424.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220423.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220417.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220416.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220410.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220409.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220403.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220402.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220327.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220326.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220321.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220320.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220319.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220313.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220312.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220306.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220305.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220227.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220226.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220220.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220219.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220213.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220212.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220206.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220205.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220130.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220129.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220123.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220122.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220116.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220115.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220110.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220109.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220108.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/2022/SED220105.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2021.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2020.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2019.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2018.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2017.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2016.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2015.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2014.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2013.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2012.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2011.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2010.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2009.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2008.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2007.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2006.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2005.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2004.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2003.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2002.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2001.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_2000.zip
# wget --http-user=22027075 --http-passwd=21224577 http://www.jrdb.com/member/datazip/Sed/SED_1999.zip


