#!/bin/bash
ls
rm -f ./test_input/*
rm -f ./tmp/*
python3 src/get_schedule.py > ./resource/schedule.json