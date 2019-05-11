import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meituan/src/Widget/slidesShow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///推荐商品卡片
  Widget _buildProductView({double height = 200.0}) {
    return Container(
      height: height,
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "故宫博物院（故宫）（5A)",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(
                    Icons.highlight_off,
                    size: 20.0,
                  ),
                ],
              ),
              SizedBox(height: 5.0,),
              Row(
                children: <Widget>[
                  Text("4.8分", style: TextStyle(color: Colors.orange, fontSize: 12.0),),
                  Text(" | 东城区", style: TextStyle(fontSize: 12.0),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset("images/test.png", width: (MediaQuery.of(context).size.width - 60.0) / 3.0,),
                  Image.asset("images/test.png", width: (MediaQuery.of(context).size.width - 60.0) / 3.0,),
                  Image.asset("images/test.png", width: (MediaQuery.of(context).size.width - 60.0) / 3.0,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ///主界面AppBar
  AppBar _buildHomeAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "三河",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 15.0,
                    ),
                  ],
                ),
                Text(
                  "晴 20°",
                  style: TextStyle(fontSize: 10.0),
                )
              ],
            ),
            padding: const EdgeInsets.all(8.0),
          ),
          Expanded(
            child: Container(
              height: 45.0,
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.black87,
                      size: 20.0,
                    ),
                    Text(
                      "自助烤肉",
                      style: TextStyle(fontSize: 15.0, color: Colors.black87),
                    ),
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

    Widget _buildImageButton(Image image, String title) {
      return Container(
        width: (MediaQuery.of(context).size.width - 30) / 5.0,
        child: Column(
          children: <Widget>[
            Container(
              child: image,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      );
    }

    List<Widget> _buildTitle(List<String> strs, double width) {
      List<Widget> titleList = <Widget>[];
      strs.forEach((str) => titleList.add(_buildImageButton(
          Image.asset(
            "images/test.png",
            width: width,
            height: width,
          ),
          str)));
      return titleList;
    }

    List<Widget> _buildBody() {
      return <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 5.0, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title1, 50.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title2, 30.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title3, 30.0),
          ),
        ),
        SlidesShowWidget(),
        _buildProductView(),
        _buildProductView(),
        _buildProductView(),
      ];
    }

    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: ListView(
        children: _buildBody(),
      ),
    );
  }
}
