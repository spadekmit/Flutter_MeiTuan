import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(1, 1.6),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
        break;
      default:
        return Center(
          child: Image.asset("images/test.png"),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = (MediaQuery.of(context).size.width - 20.0) / 2;
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
            title: Text(
              "发现",
              style: TextStyle(
                color: CupertinoColors.black,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
                isScrollable: true,
                tabs: tabStr
                    .map((str) => Tab(
                          key: Key(str),
                          text: str,
                        ))
                    .toList()),
          ),
          body: TabBarView(children: <Widget>[
            _buildBody(0),
            _buildBody(1),
            _buildBody(2),
            _buildBody(3),
            _buildBody(4),
            _buildBody(5),
            _buildBody(6),
            _buildBody(7),
            _buildBody(8),
          ]),
        ),
      ),
    );
  }
}
