import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meituan/src/Route/searchPage.dart';
import 'package:flutter_meituan/src/Route/testPage.dart';
import 'package:flutter_meituan/src/Style/myTheme.dart';
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
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        //适配刘海
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipOval(
                child: Image.asset("images/protrait.png",
                    width: 35.0, height: 35.0),
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
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => SearchPage()
                  ));
                },
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
            ),
            IconButton(
              iconSize: 30,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  return TextPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteMenu() {
    
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
      "images/title/18.png",
      "images/title/17.png",
      "images/title/16.png",
      "images/title/19.png",
      "images/title/20.png",
    ];
    const title2 = <String>[
      "亲子",
      "健身/游泳",
      "周边游/旅游",
      "丽人/美发",
      "超市/生鲜",
    ];
    const url2 = <String>[
      "images/title/6.png",
      "images/title/7.png",
      "images/title/8.png",
      "images/title/9.png",
      "images/title/10.png",
    ];
    const title3 = <String>[
      "医疗/牙科",
      "生活服务",
      "景点/门票",
      "签到领现金",
      "更多",
    ];
    const url3 = <String>[
      "images/title/11.png",
      "images/title/12.png",
      "images/title/13.png",
      "images/title/14.png",
      "images/title/15.png",
    ];

    List<Widget> _buildTitle(
        List<String> strs, List<String> urls, double width) {
      List<Widget> titleList = <Widget>[];
      for (int i = 0; i < strs.length; i++) {
        titleList.add(MyImageButton(
            image: Image.asset(
              urls[i],
              width: width,
              height: width,
            ),
            title: strs[i],
            width: (screenWidth - 30) / 5.0));
      }
      return titleList;
    }

    List<Widget> _buildBody() {
      return <Widget>[
        //第一行标题栏
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 5.0, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyImageButton(
                  image: Image.asset(
                    url1[0],
                    width: screenWidth / 7,
                    height: screenWidth / 7,
                  ),
                  title: title1[0],
                  width: (screenWidth - 30) / 5.0),
              MyImageButton(
                  image: Image.asset(
                    url1[1],
                    width: screenWidth / 7,
                    height: screenWidth / 7,
                  ),
                  title: title1[1],
                  width: (screenWidth - 30) / 5.0),
              MyImageButton(
                  image: Image.asset(
                    url1[2],
                    width: screenWidth / 7,
                    height: screenWidth / 7,
                  ),
                  title: title1[2],
                  width: (screenWidth - 30) / 5.0,
                tip: "嗨抢",
              ),
              MyImageButton(
                  image: Image.asset(
                    url1[3],
                    width: screenWidth / 7,
                    height: screenWidth / 7,
                  ),
                  title: title1[3],
                  tip: "网咖",
                  width: (screenWidth - 30) / 5.0),
              MyImageButton(
                  image: Image.asset(
                    url1[4],
                    width: screenWidth / 7,
                    height: screenWidth / 7,
                  ),
                  title: title1[4],
                  width: (screenWidth - 30) / 5.0),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        //第二行标题栏
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
        //第三行标题栏
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTitle(title3, url3, screenWidth / 14.0),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 30.0, bottom: 0.0),
            child: SlidesShowWidget(height: 80,)
        ),
        ScenicCard(
          price: PriceText("5"),
          score: "4.8分",
          address: " | 东城区",
          title: "故宫博物院（故宫) (5A)",
          tags: <Widget>[
            MyTag(tag: "网红地打卡"),
            MyTag(tag: "帝王宫殿"),
            MyTag(tag: "5A景点"),
          ],
          imageUrls: <String>[
            "http://p0.meituan.net/travel/83544ca4b38bbe0f7644982c3528defd117921.jpg@660w_500h_1e_1c",
            "http://p1.meituan.net/poi/e732ed2314a1a2619e6c3254fd2f1fd0112611.jpg",
            "http://p0.meituan.net/poi/e7d94c4d609e5dd4d71bcea6a5eb0c5e220371.jpg"
          ],
        ),
        BigPictureCateCard(
          title: "老北京涮肉 4 人餐",
          content: "套餐包括：羔羊肉，肥牛，香辣锅，鱼丸，炸灌肠，...",
          address: "南锣鼓巷",
          price: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "￥",
                  style: TextStyle(fontSize: 10.0, color: Colors.red)),
              TextSpan(
                  text: "139",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "￥190",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black,
                      fontSize: 10.0))
            ]),
          ),
          tags: <Widget>[
            MyTag(
              tag: "5.7折",
              isEmphasize: true,
            ),
            MyTag(tag: "销量火爆")
          ],
          imageUrls: <String>[
            "http://p1.meituan.net/deal/87d9fbf3dba19daf2becbca8c8daee74145248.jpg@428w_320h_1e_1c",
            "http://p0.meituan.net/deal/2d65c591c7b02f9ca9bc61f667262319220693.jpg@428w_320h_1e_1c",
            "http://p1.meituan.net/deal/4aea58490b74263d7170177fe3ab9f4c26990.jpg@428w_320h_1e_1c"
          ],
        ),
        ScenicCard(
          price: Text(
            "免费",
            style: TextStyle(
                color: Colors.red, fontSize: 10.0, fontWeight: FontWeight.bold),
          ),
          score: "4.6分",
          address: " | 后海/什刹海",
          title: "后海",
          tags: <Widget>[MyTag(tag: "城市地标"), MyTag(tag: "陪爸妈")],
          imageUrls: <String>[
            "https://p1.meituan.net/hotel/828cc5794f92e40c5de5182cb1b30993316981.jpg@220w_125h_1e_1c",
            "http://p1.meituan.net/hoteltdc/998c2b9face5e48942e10b90bf42803a154752.jpg",
            "http://p0.meituan.net/hotel/aaa8a7aed2ce2fe43aea50d6616293b2119956.jpg"
          ],
        ),
      ];
    }

    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: Container(
        decoration: GradientDecoration,
        child: ListView(
          children: _buildBody(),
        ),
      ),
    );
  }
}
