import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/style/myTheme.dart';
import 'package:flutter_meituan/src/widget/orderCard.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    const tabStr = <String>[
      "全部",
      "待付款",
      "待使用",
      "待评价",
      "退款/售后",
    ];

    return DefaultTabController(
      length: 5,
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: '.SF UI Text',
          fontWeight: FontWeight.w400,
          inherit: false,
          fontSize: 20.0,
          color: CupertinoColors.black,
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text("我的订单"),
            centerTitle: true,
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.all(0.0),
                isScrollable: false,
                tabs: tabStr
                    .map((str) => Tab(
                          key: Key(str),
                          text: str,
                        ))
                    .toList()),
          ),
          body: Container(
            decoration: GradientDecoration,
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(children: <Widget>[
              ListView(
                children: <Widget>[
                  OrderCard(
                    protraitUrl: "images/title/25.png",
                    imageUrl: "https://p0.meituan.net/mogu/1a7f305d50acbd166b4bdc6bdf8cc303422478.jpg@220w_125h_1e_1c",
                    state: "已评价",
                    title: "渔翁乐烤全鱼2人餐",
                    infos: <String>["数量: 1", "总价: ￥78.8"],
                  ),
                  OrderCard(
                    protraitUrl: "images/title/23.png",
                    imageUrl: "https://p1.meituan.net/waimaipoi/91de91605dc5569eebd9f656a98d41bf20591.jpg@220w_125h_1e_1c",
                    state: "待评价",
                    title: "叫了个炸鸡（鑫乐汇店）",
                    infos: <String>["下单时间: 2019-04-06 11:11", "总价: ￥24.8"],
                  ),
                  OrderCard(
                    protraitUrl: "images/title/24.png",
                    imageUrl: "https://p0.meituan.net/msmerchant/e56d686e99b883e597f75afa855c13f34261888.jpg@220w_125h_1e_1c",
                    state: "已退款",
                    title: "渔之恋烤鱼2人餐",
                    infos: <String>["数量: 1", "总价: ￥68"],
                  ),
                ],
              ),
              Center(
                child: Text("暂无订单", style: TextStyle(fontSize: 30),),
              ),
              Center(
                child: Text("暂无订单", style: TextStyle(fontSize: 30),),
              ),
              Center(
                child: Text("暂无订单", style: TextStyle(fontSize: 30),),
              ),
              Center(
                child: Text("暂无订单", style: TextStyle(fontSize: 30),),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
