#!/bin/sh
#####################################################################################################
# Outline of processing                                                                             #
# Asset name  tensou.sh                                                                             #
# Processing content                                                                                #
# Get file date list day of mission-critical systems has created.                                   #
# I determine retrieve target data listed in the list file date day.                                #
#                                                                                                   #
# Notices                                                                                           #
# Nothing in particular                                                                             #
#                                                                                                   #
#                                                                                                   #
# Input directory name :${home}${inlist}                                                            #
# Input directory name :${home}${indata}                                                            #
# Target file name     :E${kaisya}${daylist}hhmmdd                                                  #
# Output directory name:${home}${outdata}	                                                    #
# Target list file     :E${kaisya}${daylist}hhmmdd.list                                             #
#                                                                                                   #
#                                                                                                   #
# Processing details                                                                                #
# 1.Environment variable settings                                                                   #
#                                                                                                   #
# 2.Parameter check                                                                                 #
# 	If abnormal, the process is completed and outputs a log.                                    #
#                                                                                                   #
# 3.Check presence of the target directory                                                          #
# 	If the directory does not exist, and the process ends and outputs the log.		    #
#                                                                                                   #
# 4.Get a list file                                                                                 #
# I get a target list of file date day.                                                             #
# 	If the target list file does not exist,                                                     #
#         I make conditional normal termination and the process output to the log to that effect.   #
#                                                                                                   #
# 5.Acquisition of the target file                                                                  #
# From the description date information list file, I get a target file that day.                    #
# 	If the target file is not listed, thereby conditional normal termination                    #
#         processing is output to the log to that effect.	                                    #
#                                                                                                   #
# 	If the target file that is listed does not exist,                                           #
#         I make conditional normal termination and the process output to the log to that effect.   #
#                                                                                                   #
# 6.Target file check                                                                               #
# 	If abnormal, the process is completed and outputs a log.                                    #
#                                                                                                   #
#                                                                                                   #
#                                                                                                   #
#                                                                                                   #
#                                                                                                   #
#                                                                                                   #
#                                                                                                   #
#####################################################################################################
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
