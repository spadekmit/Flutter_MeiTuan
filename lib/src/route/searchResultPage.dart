import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meituan/src/route/searchPage.dart';
import 'package:flutter_meituan/src/widget/commonWidget.dart';
import 'package:provide/provide.dart';

class SearchResultPage extends StatefulWidget {
  SearchResultPage({@required this.searchStr});

  final String searchStr;
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  Widget _buildSelected3() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("智能排序"),
          ),
          ListTile(
            title: Text("好评优先"),
          ),
          ListTile(
            title: Text("离我最近"),
          ),
          ListTile(
            title: Text("人均最低"),
          ),
          ListTile(
            title: Text("人均最高"),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildSelected2() {}

  Widget _buildSelectedCard(int index) {
    switch (index) {
      case 1:
        return Container(
          color: Colors.white,
          height: 300,
          child: Center(
            child: Text("test"),
          ),
        );
      case 2:
        return _buildSelected3();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final providers = Providers()
      ..provide(Provider.function((context) => SortData(0)));
    return ProviderNode(
      providers: providers,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Provide.value<SortData>(context).setLevel1(0);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchPage()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(45.0))),
                      color: CupertinoColors.lightBackgroundGray,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
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
                                  fontSize: 16,
                                  color: Colors.grey,
                                  height: 0.8),
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
                                  return Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {},
                                            ),
                                            Expanded(
                                              child: buildFakeSearchBox(
                                                  Icons.location_on,
                                                  "请输入街道，大厦或小区名称"),
                                            ),
                                            SizedBox(width: 60,)
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          isActivity: false,
                        ),
                        SortButton(
                          label: "排序",
                          onPress: () => sortData.setLevel1(2),
                          isActivity: sortData.level1 == 2,
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
                                _buildSelectedCard(sortData.level1),
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
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  SortButton({@required this.label, this.isActivity = false, this.onPress});

  final String label;
  final VoidCallback onPress;
  final bool isActivity;
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
                isActivity
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

class SortData with ChangeNotifier {
  int _level1Item;

  int get level1 => _level1Item;

  SortData(this._level1Item);

  void setLevel1(int newValue) {
    if (newValue == _level1Item) {
      _level1Item = 0;
    } else {
      _level1Item = newValue;
    }
    notifyListeners();
  }
}
