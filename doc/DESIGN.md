# 业务流程
![处理流程图](./images/design.png "处理流程图")

主要分采集collect和展示display两部分：
- collect通过git log的命令将数据进行格式化到file中，通过mysql_put将数据写入到mysql数据库
- display通过select展示结果
