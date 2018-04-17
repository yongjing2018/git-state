业务流程：
系统仅仅依赖ES和MQ，通过检查ES中的数据变化，将计算任务Event下发的到MQ（Event Bus）
由于EventHandler进行处理将结果写入到DB（ES）中。

Event的结构定义：消息topic，消息体：header和body
1）定义说明
# 库存存量发生变更
topic：hll.scm.report.voucher_balance_changed
header：{id，client，biz，version，abflag，ts}
body：{groupID,balance,...}

# 库存存量策略max,min发生变更
topic：hll.scm.report.voucher_policy_changed
header：{id，client，biz，version，abflag，ts}
body：{groupID,goodID,max,min}


将到期供应商协议价查询
定时检查哪些供应商协议价到期了
分2个topic
1）时钟变化，需要进行检查，即将所有的剩余天数进行递减；
datetime_changed 需要进行检查一遍所有的结果
start, end, 这块是针对商品类/商品， 会涉及到供应商和门店/仓库，
其实这块就是商品价格的表—— 判断一个商品的价格，需要从取价表中直接得到。
商品的价格是商品添加的时候指定，并且会在商品协议价制定的时候进行修改（商品有2类价格：基本价格，协议价格s）
关于协议价： 有可能需要查询对应供应商的所有协议价格。 另外，由于协议价——是否可以针对品类进行设定？
配送价：由于谈的时候是可以针对蔬菜类，按斤进行配送，所以是可以采用。 有些时候配送价是为0，免费配送。
运费价格是需要单独设定的。


2）修改或者新增供应商协议，导致相关的商品都需要进行变更对应的协议价；


