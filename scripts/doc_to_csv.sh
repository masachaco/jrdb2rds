#!/bin/bash

more trimed_spec/bab.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/bab.csv
more trimed_spec/bac.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/bac.csv
more trimed_spec/cha.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/cha.csv
more trimed_spec/csa.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/csa.csv
more trimed_spec/cya.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/cya.csv
more trimed_spec/cyb.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/cyb.csv
more trimed_spec/cza.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/cza.csv
more trimed_spec/hja.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/hja.csv
more trimed_spec/hjc.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/hjc.csv
more trimed_spec/joa.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/joa.csv
more trimed_spec/kaa.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kaa.csv
more trimed_spec/kab.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kab.csv
more trimed_spec/kka.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kka.csv
more trimed_spec/ksa.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/ksa.csv
more trimed_spec/kta.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kta.csv
more trimed_spec/kyg.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kyg.csv
more trimed_spec/kyh.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kyh.csv
more trimed_spec/kyi.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kyi.csv
more trimed_spec/kza.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/kza.csv
more trimed_spec/msa.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/msa.csv
more trimed_spec/mza.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/mza.csv
more trimed_spec/ot.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/ot.csv
more trimed_spec/ou.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/ou.csv
more trimed_spec/ov.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/ov.csv
more trimed_spec/ow.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/ow.csv
more trimed_spec/oz.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/oz.csv
more trimed_spec/sec.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/sec.csv
more trimed_spec/secsoku.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/secsoku.csv
more trimed_spec/sed.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/sed.csv
more trimed_spec/skb.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/skb.csv
more trimed_spec/sra.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/sra.csv
more trimed_spec/srb.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/srb.csv
more trimed_spec/tyb.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/tyb.csv
more trimed_spec/ukc.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/ukc.csv
more trimed_spec/zec.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/zec.csv
more trimed_spec/zkb.txt | awk -F ' ' -v 'OFS=,' '{print $1,$2,$3,$4}' | sed '1s/^/name,byte,type,ref_index\n/' |grep -v ",,," |grep -v ",,"  |sed 's/^[ 　\t]*//' > spec_csv/zkb.csv
