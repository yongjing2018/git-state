#!/bin/sh
path=`pwd`
#project_name='api-portal'
#project_path='/home/project/supplychain/api-portal/'
project_name=$1
project_path=$2

logfl="${path}/count_log.dat"
countsh="${path}/count_git.sh"
putsh="${path}/put_mysql.sh"
echo ${logfl}
cd ${project_path}
git checkout test
git pull origin test
sh ${countsh} > ${logfl}
sh ${putsh} ${project_name} ${logfl}
