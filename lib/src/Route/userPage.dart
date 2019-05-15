import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Style/myTheme.dart';
import 'package:flutter_meituan/src/Widget/commonWidget.dart';
import 'package:flutter_meituan/src/Widget/slidesShow.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Widget _buildTile(String top, String mid, String bot, {String tip}) {
    return Container(
      height: 90.0,
      width: 70.0,
      child: Stack(children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                top,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                mid,
                style: TextStyle(fontSize: 12.0),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                bot,
                style: TextStyle(fontSize: 8.0, color: Colors.grey),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: tip != null
              ? MyTag(
                  tag: tip,
                  isEmphasize: true,
                  radius: 15.0,
                )
              : null,
        ),
      ]),
    );
  }

  Widget _buildRow(List<Widget> buttonList) {
    final width = (MediaQuery.of(context).size.width - 20 * 2) / 4;
    var list = <Widget>[];
    buttonList.forEach((w) {
      list.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: width - 3,
        child: w,
      ));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    var list1 = <Widget>[
      MyImageButton(
        image: Image.asset(
          "images/title/1.png",
          height: 25,
        ),
        title: "邀请有礼",
        tip: "10元",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/2.png",
          height: 25,
        ),
        title: "手机充值",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/3.png",
          height: 25,
        ),
        title: "火车票/机票",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/4.png",
          height: 25,
        ),
        title: "新个税计算",
      ),
    ];

    var list2 = <Widget>[
      MyImageButton(
        image: Image.asset(
          "images/title/1.png",
          height: 25,
        ),
        title: "会员中心",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/2.png",
          height: 25,
        ),
        title: "美团公益",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/3.png",
          height: 25,
        ),
        title: "免流用美团",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/4.png",
          height: 25,
        ),
        title: "发票助手",
      ),
    ];

    var list3 = <Widget>[
      MyImageButton(
        image: Image.asset(
          "images/title/1.png",
          height: 25,
        ),
        title: "我要合作",
      ),
      MyImageButton(
        image: Image.asset(
          "images/title/2.png",
          height: 25,
        ),
        title: "关于美团",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 140.0,
              margin: const EdgeInsets.only(
                  left: 24.0, right: 14.0, top: 24.0, bottom: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "images/protrait.png",
                          height: 50.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "lbJ153689667",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Icon(Icons.settings),
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(Icons.headset_mic)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyImageButton(
                        image: Icon(
                          Icons.star,
                          size: 30.0,
                        ),
                        title: "收藏",
                        width: 60.0,
                      ),
                      MyImageButton(
                        image: Icon(
                          Icons.branding_watermark,
                          size: 30.0,
                        ),
                        title: "评价",
                        width: 60.0,
                      ),
                      MyImageButton(
                        image: Icon(
                          Icons.local_mall,
                          size: 30.0,
                        ),
                        title: "红包/卡卷",
                        width: 60.0,
                      ),
                      MyImageButton(
                        image: Icon(
                          Icons.textsms,
                          size: 30.0,
                        ),
                        title: "消息",
                        width: 60.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "我的钱包",
                          style: CardTitleTextStyle,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          "进入钱包",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10.0,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildTile("4000", "借钱", "大约可借(元)", tip: "红包"),
                          _buildTile("10万", "美团信用卡", "最高额度(元)"),
                          _buildTile("124元", "用卡享优惠", "最高随机减"),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 1.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SlidesShowWidget(
                          height: 80,
                        )),
                    Divider(
                      color: Colors.grey,
                      height: 1.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "推荐工具",
                      style: CardTitleTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildRow(list1),
                          _buildRow(list2),
                          _buildRow(list3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
