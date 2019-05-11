import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildImageButton(Image image, String title) {
    return Container(
      width: 70.0,
      child: Column(
        children: <Widget>[
          Container(
            child: image,
          ),
          Text(title, style: TextStyle(fontSize: 12.0),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const title1 = <String>[
      "美食",
      "电影/演出",
      "酒店住宿",
      "休闲娱乐",
      "外卖",
    ];
    const title2 = <String>[
      "亲子",
      "健身/游泳",
      "周边游/旅游",
      "丽人/美发",
      "超市/生鲜",
    ];
    const title3 = <String>[
      "医疗/牙科",
      "生活服务",
      "景点/门票",
      "签到领现金",
      "更多",
    ];

    List<Widget> _buildTitle1(List<String> strs, double width){
      List<Widget> titleList = <Widget>[];
      strs.forEach((str) =>
        titleList.add(_buildImageButton(Image.asset(
          "images/test.png",
          width: width,
          height: width,
        ), str))
      );
      return titleList;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_box,
                color: Colors.black,
              ),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
            Container(
              child: Text(
                "三河",
                style: TextStyle(color: Colors.black),
              ),
              padding: const EdgeInsets.all(8),
            ),
            Expanded(
              child: Container(
                height: 35.0,
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.black87, size: 15.0,),
                      Text("自助烤肉", style: TextStyle(fontSize: 10.0, color: Colors.black87),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildTitle1(title1, 60.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildTitle1(title2, 30.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildTitle1(title3, 30.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 0.0),
            height: 120.0,
            child: PageView(
              children: <Widget>[
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  color: Colors.red,
                ),
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  color: Colors.green,
                ),
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          Container(
            height: 300.0,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              color: Colors.greenAccent,
            ),
          ),
          Container(
            height: 300.0,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              color: Colors.greenAccent,
            ),
          ),
          Container(
            height: 300.0,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
