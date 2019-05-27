import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meituan/src/route/searchPage.dart';

class SearchResultPage extends StatefulWidget {
  SearchResultPage({@required this.searchStr});

  final String searchStr;
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  StreamController<int> _controller;
  int oldIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>.broadcast();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
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
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage())),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0))),
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
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: StreamBuilder<int>(
              stream: _controller.stream,
              initialData: 0,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SortButton(
                      label: "全部分类",
                      onPress: () {
                        int index;
                        index = snapshot.data == oldIndex ? 0 : 1;
                        _controller.sink.add(index);
                        oldIndex = index;
                      },
                      isActivity: snapshot.data == 1,
                    ),
                    SortButton(
                      label: "全城",
                      onPress: () {
                        int index;
                        index = snapshot.data == oldIndex ? 0 : 2;
                        _controller.sink.add(index);
                        oldIndex = index;
                      },
                      isActivity: snapshot.data == 2,
                    ),
                    SortButton(
                      label: "智能排序",
                      onPress: () {
                        int index;
                        index = snapshot.data == oldIndex ? 0 : 3;
                        _controller.sink.add(index);
                        oldIndex = index;
                      },
                      isActivity: snapshot.data == 3,
                    ),
                  ],
                );
              }
            ),
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
                StreamBuilder<int>(
                    stream: _controller.stream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      switch (snapshot.data) {
                        case 0:
                          return Container();
                          break;
                        case 1:
                        case 2:
                        case 3:
                          return Column(
                            children: <Widget>[
                              Container(
                                color: Colors.white,
                                height: 300,
                                child: Center(
                                  child: Text("test"),
                                ),
                              ),
                              Expanded(
                                child: Opacity(
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                  opacity: 0.6,
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
      )),
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
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(color: isActivity ? Colors.green : Colors.black),
          ),
          Icon(
            isActivity ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: isActivity ? Colors.green : Colors.black,
          ),
        ],
      ),
    );
  }
}