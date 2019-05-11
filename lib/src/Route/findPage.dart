import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {

    const tabStr = <String>[
      "推荐",
      "旅行",
      "丽人",
      "电影",
      "结婚",
      "购物",
      "教培",
      "家装",
      "亲子",
    ];

    return DefaultTabController(
      length: 9,
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
            backgroundColor: Colors.white,
            title: Text("发现", style: TextStyle(color: CupertinoColors.black,),),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
                tabs: tabStr.map((str) => Tab(
              key: Key(str),
              text: str,
            )).toList()),
          ),
          body: TabBarView(children: <Widget>[
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
            Center(child: Image.asset("images/test.png"),),
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