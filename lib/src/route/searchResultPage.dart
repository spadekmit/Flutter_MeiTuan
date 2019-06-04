import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meituan/src/data/searchData.dart';
import 'package:flutter_meituan/src/route/searchPage.dart';
import 'package:flutter_meituan/src/widget/buttons.dart';
import 'package:flutter_meituan/src/widget/commonWidget.dart';
import 'package:provide/provide.dart';

class SearchResultPage extends StatefulWidget {
  SearchResultPage({@required this.searchStr});

  final String searchStr;

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final sortLabel = <String>[
    "排序",
    "智能排序",
    "好评优先",
    "离我最近",
    "人均最低",
    "人均最高",
  ];

  @override
  Widget build(BuildContext context) {
    ///包含一个返回按钮和一个假的输入框
    final appBar = AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Row(
          children: <Widget>[
            //返回按钮
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            //假的搜索框
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Provide.value<SearchData>(context).setMenuTag("");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: buildFakeSearchBox(Icons.search, widget.searchStr),
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );

    ///控制搜索选项的菜单栏
    Widget _buildMenuBar() {
      return Provide<SearchData>(
        builder: (context, _, searchData) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 10),
              child: Provide<SearchData>(builder: (context, _, sortData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 36,
                        child: ListView(
                          children: <Widget>[
                            DropDownMenuButton(
                              label: "全城",
                              onPress: () {
                                sortData.setMenuTag("全城");
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return _buildAreaMenu(context);
                                    });
                              },
                              isActivity: false,
                            ),
                            DropDownMenuButton(
                              label: sortLabel[sortData.level1_2],
                              onPress: () => sortData.setMenuTag("排序"),
                              isActivity: sortData.level1 == 2 ||
                                  sortData.level1_2 != 0,
                              iconActivity: sortData.level1 == 2,
                            ),
                            SelectableButton(
                              tag: "点外卖",
                              width: 80,
                              height: 40,
                              onTap: () => searchData.changeTag("点外卖"),
                              isActivity: searchData.tag.contains("点外卖"),
                            ),
                            SelectableButton(
                              tag: "到店买",
                              width: 80,
                              height: 40,
                              onTap: () => searchData.changeTag("到店买"),
                              isActivity: searchData.tag.contains("到店买"),
                            ),
                            DropDownMenuButton(
                              label: '精选品牌',
                            ),
                            SelectableButton(
                              tag: "买单优惠",
                              width: 80,
                              height: 40,
                              onTap: () => searchData.changeTag("买单优惠"),
                              isActivity: searchData.tag.contains("买单优惠"),
                            ),
                            SelectableButton(
                              tag: "团购",
                              width: 80,
                              height: 40,
                              onTap: () => searchData.changeTag("团购"),
                              isActivity: searchData.tag.contains("团购"),
                            ),
                            SelectableButton(
                              tag: "点评高分",
                              width: 80,
                              height: 40,
                              onTap: () => searchData.changeTag("点评高分"),
                              isActivity: searchData.tag.contains("点评高分"),
                            ),
                          ],
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => searchData.setMenuTag("更多"),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "更多",
                            style: TextStyle(fontSize: 13),
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                );
              }),
            ),
      );
    }

    ///搜索结果列表
    final resultList = ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) => Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    "https://p0.meituan.net/deal/8ca044a09ab4edf9f13b3f5bed67664f102164.jpg@220w_125h_1e_1c",
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text("巫山烤全鱼"),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4.7分",
                            style: TextStyle(color: Colors.orange),
                          )
                        ],
                      ),
                      Text(
                        "烤鱼|燕郊  燕郊燕顺路星河皓月八匹马往里100米",
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("人均￥41"),
                    ],
                  ),
                ),
                Container(
                  height: 5,
                  color: CupertinoColors.lightBackgroundGray,
                ),
              ],
            ),
          ),
    );

    Widget body = Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildMenuBar(),
            Expanded(
              child: Stack(
                children: <Widget>[
                  resultList,
                  Provide<SearchData>(builder: (context, _, searchData) {
                    switch (searchData.menuTag) {
                      case "":
                      case "全城":
                        return Container();
                        break;
                      case "排序":
                        return Column(
                          children: <Widget>[
                            _buildSortMenu(),
                            Expanded(
                              child: Opacity(
                                child: GestureDetector(
                                  onTap: () => searchData.setMenuTag(""),
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                                opacity: 0.6,
                              ),
                            )
                          ],
                        );
                        break;
                      case "更多":
                        return Row(
                          children: <Widget>[
                            Expanded(
                                child: Opacity(
                              child: GestureDetector(
                                onTap: () => searchData.setMenuTag(""),
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                              opacity: 0.4,
                            )),
                            Container(
                              width: 270,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("全部分类"),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "美食",
                                      ),
                                      SelectableButton(
                                        tag: "本地购物",
                                      ),
                                      SelectableButton(
                                        tag: "学习培训",
                                      ),
                                    ],
                                  ),
                                  Text("精选品牌"),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "金手勺",
                                      ),
                                      SelectableButton(
                                        tag: "吃上瘾麻辣烫",
                                      ),
                                      SelectableButton(
                                        tag: "江边食尚",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "味妙烤鱼吧",
                                      ),
                                      SelectableButton(
                                        tag: "魔锅坊麻辣烫",
                                      ),
                                      SelectableButton(
                                        tag: "望京小腰",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("套餐人数"),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "单人餐",
                                      ),
                                      SelectableButton(
                                        tag: "双人餐",
                                      ),
                                      SelectableButton(
                                        tag: "3-4人餐",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "5-6人餐",
                                      ),
                                      SelectableButton(
                                        tag: "7-10人餐",
                                      ),
                                      SelectableButton(
                                        tag: "10人以上",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("餐厅特色"),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "环境优雅",
                                      ),
                                      SelectableButton(
                                        tag: "朋友聚餐",
                                      ),
                                      SelectableButton(
                                        tag: "家庭聚会",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SelectableButton(
                                        tag: "请客聚会",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                    }
                  })
                ],
              ),
            )
          ],
        ));
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  ///排序按钮弹出卡片
  Widget _buildSortMenu() {
    return Container(
      color: Colors.white,
      child: Provide<SearchData>(
        builder: (context, _, sortData) {
          var onTap = (int index) => sortData.setLevel1_2(index);
          var list = <Widget>[];
          for (int i = 1; i < 6; i++) {
            list.add(_buildSortItem(
                sortLabel[i], sortData.level1_2 == i, () => onTap(i)));
          }

          return Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              ...list,
              SizedBox(
                height: 100,
              ),
            ],
          );
        },
      ),
    );
  }

  ///排序卡片内的可选中按钮
  Widget _buildSortItem(String label, bool isActivity, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  fontSize: 14, color: isActivity ? Colors.teal : Colors.black),
            ),
            isActivity
                ? Icon(
                    Icons.check,
                    color: Colors.teal,
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  ///地区选择界面中的标签按钮
  Widget _buildLabelButton(String label, bool isActivity, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: isActivity ? Colors.teal : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  ///全城按钮底部弹出的菜单
  Widget _buildAreaMenu(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 20),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.teal,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child:
                        buildFakeSearchBox(Icons.location_on, "请输入街道，大厦或小区名称"),
                  ),
                  SizedBox(
                    width: 60,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Provide<SearchData>(
                builder: (context, _, sortData) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 5),
                            _buildLabelButton("附近", sortData.level1_1 == 1,
                                () => sortData.setLevel1_1(1)),
                            SizedBox(
                              height: 30,
                            ),
                            _buildLabelButton("行政区/商圈", sortData.level1_1 == 2,
                                () => sortData.setLevel1_1(2)),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        _buildAreaLabel(context, sortData),
                      ],
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildAreaLabel(BuildContext context, SearchData sortData) {
    final width = MediaQuery.of(context).size.width / 4.7;
    final height = MediaQuery.of(context).size.width / 10;

    void onTap1(int distance) {
      sortData.setDistance(distance);
      Navigator.of(context).pop();
    }

    void onTap2(String district) {
      sortData.setDistrict(district);
      Navigator.of(context).pop();
    }

    switch (sortData.level1_1) {
      case 1:
        return Container(
          width: 280,
          child: Wrap(
            children: <Widget>[
              SelectableButton(
                tag: "1km",
                width: width,
                height: height,
                onTap: () => onTap1(1),
                isActivity: sortData.distance == 1,
              ),
              SelectableButton(
                tag: "3km",
                width: width,
                height: height,
                onTap: () => onTap1(3),
                isActivity: sortData.distance == 3,
              ),
              SelectableButton(
                tag: "5km",
                width: width,
                height: height,
                onTap: () => onTap1(5),
                isActivity: sortData.distance == 5,
              ),
              SelectableButton(
                tag: "10km",
                width: width,
                height: height,
                onTap: () => onTap1(10),
                isActivity: sortData.distance == 10,
              ),
            ],
          ),
        );
      case 2:
        return Container(
          width: 280,
          child: Wrap(
            children: <Widget>[
              SelectableButton(
                tag: "燕郊",
                width: width,
                height: height,
                onTap: () => onTap2("燕郊"),
                isActivity: sortData.district == "燕郊",
              ),
              SelectableButton(
                tag: "三平站",
                width: width,
                height: height,
                onTap: () => onTap2("三平站"),
                isActivity: sortData.district == "三平站",
              ),
              SelectableButton(
                tag: "甘泉寺",
                width: width,
                height: height,
                onTap: () => onTap2("甘泉寺"),
                isActivity: sortData.district == "甘泉寺",
              ),
              SelectableButton(
                tag: "三河市中心",
                width: width,
                height: height,
                onTap: () => onTap2("三河市中心"),
                isActivity: sortData.district == "三河市中心",
              ),
            ],
          ),
        );
    }
  }
}
