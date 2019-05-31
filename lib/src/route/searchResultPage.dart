import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meituan/src/data/sortData.dart';
import 'package:flutter_meituan/src/route/searchPage.dart';
import 'package:flutter_meituan/src/widget/commonWidget.dart';
import 'package:provide/provide.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
//import 'package:html/dom.dart';

class SearchResultPage extends StatefulWidget {
  SearchResultPage({@required this.searchStr});

  final String searchStr;

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {

  final dio = Dio();

  final sortLabel = <String>[
    "排序",
    "智能排序",
    "好评优先",
    "离我最近",
    "人均最低",
    "人均最高",
  ];

  @override
  void initState() {
    super.initState();
    getSearchData();
  }

  void getSearchData() async {
    var options = Options(headers: {'asdf' : 123});
    Response response = await dio.get(Uri.parse('https://lf.meituan.com/s/烤鱼/').toString());
    print(response.statusCode);
    var document = parse(response.data);
    var cards = document.getElementsByClassName('default-card');
    print(cards.length);
  }

  ///排序按钮弹出卡片
  Widget _buildSelected2() {
    return Container(
      color: Colors.white,
      child: Provide<SortData>(
        builder: (context, _, sortData) {
          var onTap = (int index) => sortData.setLevel1_2(index);
          var list = <Widget>[];
          for (int i = 1; i < 6; i++) {
            list.add(_buildLevel2Button(
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

  Widget _buildLevel2Button(String label, bool isActivity, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: InkWell(
        onTap: onTap,
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
  Widget _buildSelected1(BuildContext context) {
    return Container(
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
                  child: buildFakeSearchBox(Icons.location_on, "请输入街道，大厦或小区名称"),
                ),
                SizedBox(
                  width: 60,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Provide<SortData>(
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
                      _buildLevel1_1Label(sortData.level1_1),
                    ],
                  ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Provide.value<SortData>(context).setLevel1(0);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0))),
                    color: CupertinoColors.lightBackgroundGray,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            //搜索图标
                            Icons.search,
                            color: Colors.grey,
                            size: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.searchStr,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey, height: 0.8),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Provide<SortData>(builder: (context, _, sortData) {
                  return Row(
                    children: <Widget>[
                      SortButton(
                        label: "全城",
                        onPress: () {
                          sortData.setLevel1(0);
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return _buildSelected1(context);
                              });
                        },
                        isActivity: false,
                      ),
                      SortButton(
                        label: sortLabel[sortData.level1_2],
                        onPress: () => sortData.setLevel1(2),
                        isActivity: sortData.level1 == 2 || sortData.level1_2 != 0,
                        iconActivity: sortData.level1 == 2,
                      ),
                    ],
                  );
                }),
              ),
              Divider(
                color: Colors.grey,
                height: 0.1,
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                        ListTile(
                          title: Text("sadf"),
                        ),
                      ],
                    ),
                    Provide<SortData>(builder: (context, _, sortData) {
                      switch (sortData.level1) {
                        case 0:
                          return Container();
                          break;
                        case 2:
                          return Column(
                            children: <Widget>[
                              _buildSelected2(),
                              Expanded(
                                child: Opacity(
                                  child: GestureDetector(
                                    onTap: () => sortData.setLevel1(0),
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
                      }
                    })
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _buildLabel(String tag) {
    return Container(
      width: MediaQuery.of(context).size.width / 4.7,
      height: MediaQuery.of(context).size.width / 10,
      child: Card(
        elevation: 0.0,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Text(
              tag,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }

  _buildLevel1_1Label(int index) {
    switch (index) {
      case 1:
        return Container(
          width: 280,
          child: Wrap(
            children: <Widget>[
              _buildLabel("1km"),
              _buildLabel("3km"),
              _buildLabel("5km"),
              _buildLabel("10km"),
            ],
          ),
        );
      case 2:
        return Container(
          width: 280,
          child: Wrap(
            children: <Widget>[
              _buildLabel("燕郊"),
              _buildLabel("三平站"),
              _buildLabel("甘泉寺"),
              _buildLabel("三河市中心"),
            ],
          ),
        );
    }
  }
}

class SortButton extends StatelessWidget {
  SortButton({@required this.label, this.isActivity = false, this.iconActivity = false, this.onPress});

  final String label;
  final VoidCallback onPress;
  final bool isActivity;
  final bool iconActivity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.green,
      onTap: onPress,
      child: Card(
        elevation: 0,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    color: isActivity ? Colors.green : Colors.black,
                    fontSize: 12),
              ),
              Icon(
                iconActivity
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: isActivity ? Colors.green : Colors.black,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
