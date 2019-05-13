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
          itemBuilder: (BuildContext context, int index) => VideoCard(),
          staggeredTileBuilder: (int index) => StaggeredTile.count(1, 1.8),
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

class VideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
                "https://p0.meituan.net/moviemachine/f7d2ad70eb79d6d9b8a197713db9b8c41711752.jpg@214w_297h_1e_1c", fit: BoxFit.fitWidth,),
            SizedBox(height: 10.0,),
            Text("强烈推荐滑道。非常好玩", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                      "https://img.meituan.net/avatar/a9bf5c4ee3c5f171f264cb12d52e332137228.jpg@200w_200h_1e_1c", height: 20.0,),
                ),
                Text("vivilex"),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
