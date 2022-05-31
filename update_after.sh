#!/bin/bash
cd tmp
unzip *.zip
rm -f SRB*.txt
rm -f *_t.txt
mv *.txt ../test_input/
rm -f *.zip

