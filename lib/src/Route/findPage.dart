import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Style/myTheme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {

  Widget _buildBody(int index) {
    var rng = Random();
    switch (index) {
      case 0:
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) =>
              VideoCard(imageHeight: 80.0 + rng.nextInt(120), count: rng.nextInt(1000),),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
        // return Center(child: Text("test"),);
        break;
      default:
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) => VideoCard(count: rng.nextInt(1000),),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: GradientDecoration,
            child: TabBarView(children: <Widget>[
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
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  VideoCard({this.imageHeight, this.count});

  final double imageHeight;
  final count;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      color: Colors.white,
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
            child: Container(
              width: double.infinity,
              height: imageHeight,
              child: Image.network(
                "https://p0.meituan.net/moviemachine/f7d2ad70eb79d6d9b8a197713db9b8c41711752.jpg@214w_297h_1e_1c",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "妇联四啥的压根没看过，瞎放的图片",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    "https://img.meituan.net/avatar/a9bf5c4ee3c5f171f264cb12d52e332137228.jpg@200w_200h_1e_1c",
                    height: 20.0,
                  ),
                ),
                Text("vivilex"),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(),
                ),
                Icon(Icons.thumb_up, size: 15.0,),
                SizedBox(width: 5.0,),
                Text(count.toString()),
                SizedBox(width: 10.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
