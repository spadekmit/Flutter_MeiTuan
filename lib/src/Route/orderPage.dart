import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                isScrollable: true,
                tabs: tabStr
                    .map((str) => Tab(
                          key: Key(str),
                          text: str,
                        ))
                    .toList()),
          ),
          body: TabBarView(children: <Widget>[
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
          ]),
        ),
      ),
    );
  }
}
