# git-state
主要是通过git log统计对应的数据

## 设计文档
[设计方案](./doc/DESIGN.md)
- t_gitcode.sql 创建数据表

- run_collect.sh
+ 1. 通过count_git.sh将对应project的git log进行汇总分析
+ 2. 通过put_mysql.sh将数据写入到mysql数据库中

- select_run.sh 
+ 1. 通过select_daydiff.sh查询指定时间点内数据进行展示出来

- count_log.dat 为中间数据（可进行清理掉）

## 定时脚本
```
0 2 * * * cd /root/yongjing/git-state/bin;sh collect_counter.sh
```
