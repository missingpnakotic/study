#!/bin/sh -x

### #3=question
### #!/usr/bin/env bash or #!/bin/sh
### I want to using JAPANESE in github
### SJIS LFcode

## set hensu
## kaisya 0[0-9]
kaisya="03"

echo 'status:'$?
echo 'kaisya:'$kaisya


## set directoryname1
home="/home"
indata="/inputdata"
inlist="/inputlist"
outdata="/outputdata"

## set directoryname2
echo "indata list directory"

export list=${home}${inlist}
echo 'status:'$?
echo 'directory list:'$list

export data=${home}${indata}
echo 'status:'$?
echo 'directory data:'$data

echo "outdatadirectory"
export output=${home}${outdata}
echo 'status:'$?
echo 'directory output:'$output


## directory
cd $list;pwd
cd $data;pwd
cd $output;pwd


## set listfile
calc_date=`date +"%Y%m%d"`
echo 'status:'$?

# change test daylist
daylist=`date -d "12 days ago" +%Y%m%d`
echo 'status:'$?

export listfile="E"${kaisya}${daylist}??????".list"
echo 'status:'$?
echo $listfile

## E0320130808122354.list
## E0320131118??????.list'

cp ${list}"/"${listfile} ${output}
echo 'status:'$?

cat ${output}"/"${listfile} 
echo 'status:'$?

## Since foreach use is improper, for is used. 
## Is arrangement good? 
## Erase the line feed code space of an input using vi. 

for TXT in `cat ${output}"/"${listfile}`
do
export enduserdata=${data}"/"${TXT[@]}
cp -p ${enduserdata} ${output}
done
