#!/bin/sh
HOSTNAME="dohko.mysql.001.master.hualala.com"     #数据库信息
PORT="3306"
USERNAME="root"
PASSWORD="hualaladev"

DBNAME="db_git"        	#数据库名称
TABLENAME="t_gitcode"   #数据库中表的名称

PROJECT_NAME=$1
COUNT_LOG=$2
DS=`date "+%Y-%m-%d %H:%M:%S"`
cat ${COUNT_LOG} | while read line; do 
	echo ${line};
	insert_sql="insert into ${TABLENAME}(project_name,coder_name,added_lines,removed_lines,total_lines,gmt_create) values('${PROJECT_NAME}',${line},'${DS}');"
	echo ${insert_sql}
	mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${insert_sql}"
done # readline
