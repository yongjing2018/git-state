#!/bin/sh
HOSTNAME="dohko.mysql.001.master.hualala.com"     #数据库信息
PORT="3306"
USERNAME="root"
PASSWORD="hualaladev"

DBNAME="db_git"         #数据库名称
TABLENAME="t_gitcode"   #数据库中表的名称

TS1=$1
TS2=$2
SQL="
SELECT a.coder_name, a.added_lines as '${TS2}',IFNULL(b.added_lines,0) as '${TS1}',(a.added_lines - IFNULL(b.added_lines,0)) AS diff,(a.removed_lines - IFNULL(b.removed_lines,0)) AS del_diff
FROM (
	SELECT MAX(id),coder_name,added_lines,removed_lines
	FROM t_gitcode 
	WHERE SUBSTRING(gmt_create,1,10)='${TS2}' 
	GROUP BY coder_name) a
LEFT JOIN (
	SELECT MAX(id),coder_name,added_lines,removed_lines
	FROM t_gitcode 
	WHERE SUBSTRING(gmt_create,1,10)='${TS1}' 
	GROUP BY coder_name) b
ON a.coder_name = b.coder_name;"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${SQL}"
