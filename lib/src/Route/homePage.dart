import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meituan/src/Widget/commonWidget.dart';
import 'package:flutter_meituan/src/Widget/slidesShow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///主界面AppBar
  AppBar _buildHomeAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipOval(
              child: Image.network(
                  "http://sc.adminbuy.cn/uploads/allimg/160920/1-160920154T90-L.png",
                  width: 35.0,
                  height: 35.0),
            ),
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
                color: Colors.grey[200],
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
    final screenWidth = MediaQuery.of(context).size.width;

    const title1 = <String>[
      "美食",
      "电影/演出",
      "酒店住宿",
      "休闲娱乐",
      "外卖",
    ];
    const url1 = <String>[
      "http://sc.adminbuy.cn/uploads/allimg/160115/1-1601151501580-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160919/1-1609191646070-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160919/1-1609191615390-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160120/1-1601201511320-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160120/1-160120151G40-L.png",
    ];
    const title2 = <String>[
      "亲子",
      "健身/游泳",
      "周边游/旅游",
      "丽人/美发",
      "超市/生鲜",
    ];
    const url2 = <String>[
      "http://sc.adminbuy.cn/uploads/allimg/160919/1-1609191614370-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160421/1-160421153Q30-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160919/1-1609191623120-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160115/1-1601151513510-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/160219/1-1602191524360-L.png",
    ];
    const title3 = <String>[
      "医疗/牙科",
      "生活服务",
      "景点/门票",
      "签到领现金",
      "更多",
    ];
    const url3 = <String>[
      "http://sc.adminbuy.cn/uploads/151023/1-151023205615122.png",
      "http://sc.adminbuy.cn/uploads/151023/1-151023221943F5.png",
      "http://sc.adminbuy.cn/uploads/allimg/170119/1-1F1191325110-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/170119/1-1F1191319380-L.png",
      "http://sc.adminbuy.cn/uploads/allimg/170119/1-1F1191339130-L.png",
    ];

    Widget _buildImageButton(Image image, String title) {
      return Container(
        width: (screenWidth - 30) / 5.0,
        child: Column(
          children: <Widget>[
            Container(
              child: image,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      );
    }

    List<Widget> _buildTitle(
        List<String> strs, List<String> urls, double width) {
      List<Widget> titleList = <Widget>[];
      for (int i = 0; i < strs.length; i++) {
        titleList.add(_buildImageButton(
            Image.network(
              urls[i],
              width: width,
              height: width,
            ),
            strs[i]));
      }
      return titleList;
    }

    List<Widget> _buildBody() {
      return <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 5.0, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title1, url1, screenWidth / 7.0),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title2, url2, screenWidth / 14.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title3, url3, screenWidth / 14.0),
          ),
        ),
        SlidesShowWidget(),
        ScenicCard(price: PriceText("5"), score: "4.8分", address: " | 东城区", title: "故宫博物院（故宫) (5A)", tags: <String>[
          "网红地打卡",
          "帝王宫殿",
          "5A景点",
        ], imageUrls: <String>["http://p0.meituan.net/travel/83544ca4b38bbe0f7644982c3528defd117921.jpg@660w_500h_1e_1c",
          "http://p1.meituan.net/poi/e732ed2314a1a2619e6c3254fd2f1fd0112611.jpg",
          "http://p0.meituan.net/poi/e7d94c4d609e5dd4d71bcea6a5eb0c5e220371.jpg"],),
        BigPictureCateCard(
          title: "老北京涮肉 4 人餐",
          content: "套餐包括：羔羊肉，肥牛，香辣锅，鱼丸，炸灌肠，...",
          address: "南锣鼓巷",
          price: PriceText("139"),
          tags: <String>["销量火爆"],
          imageUrls: <String>["http://p1.meituan.net/deal/87d9fbf3dba19daf2becbca8c8daee74145248.jpg@428w_320h_1e_1c",
            "http://p0.meituan.net/deal/2d65c591c7b02f9ca9bc61f667262319220693.jpg@428w_320h_1e_1c",
            "http://p1.meituan.net/deal/4aea58490b74263d7170177fe3ab9f4c26990.jpg@428w_320h_1e_1c"],
        ),
        ScenicCard(
          price: Text("免费", style: TextStyle(color: Colors.red, fontSize: 10.0),),
          score: "4.6分",
          address: " | 后海/什刹海",
          title: "后海",
          tags: <String>["城市地标", "陪爸妈"],
          imageUrls: <String>["https://p1.meituan.net/hotel/828cc5794f92e40c5de5182cb1b30993316981.jpg@220w_125h_1e_1c",
            "http://p1.meituan.net/hoteltdc/998c2b9face5e48942e10b90bf42803a154752.jpg",
            "http://p0.meituan.net/hotel/aaa8a7aed2ce2fe43aea50d6616293b2119956.jpg"],
        ),
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
