import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Route/testPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode _focusNode;
  TextEditingController _controller;
  StreamController streamController;
  final random = Random();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    streamController = StreamController<String>();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
    streamController.close();
  }

  Widget _buildSearchRow(String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => TestPage(content: data))),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(data),
            Expanded(
              child: Container(),
            ),
            Text(
              "约" + random.nextInt(100).toString() + "个结果",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "热门搜索",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Wrap(
            children: <Widget>[
              TextTag(
                tag: "故宫博物院",
              ),
              TextTag(
                tag: "老北京涮肉",
              ),
              TextTag(
                tag: "虾吃虾涮",
              ),
              TextTag(
                tag: "故宫珍宝馆",
              ),
              TextTag(
                tag: "北京欢乐谷",
              ),
              TextTag(
                tag: "后海",
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "历史记录",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Icon(
                  Icons.delete,
                  size: 18,
                ),
              ],
            ),
          ),
          Wrap(
            children: <Widget>[
              TextTag(
                tag: "故宫博物院",
              ),
              TextTag(
                tag: "鱼",
              ),
              TextTag(
                tag: "烤鱼",
              ),
              TextTag(
                tag: "网红炸鸡",
              ),
              TextTag(
                tag: "北京欢乐谷",
              ),
              TextTag(
                tag: "米线",
              ),
              TextTag(
                tag: "钟点房",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBody(String data) {
    List<Widget> _list = <Widget>[];
    for (int i = 0; i < 20; i++) {
      _list.add(_buildSearchRow(data + (i + 1).toString()));
    }

    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: _list,
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  child: CupertinoTextField(
                    padding: EdgeInsets.all(8),
                    autofocus: true,
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 22,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                    focusNode: _focusNode,
                    maxLines: 1,
                    controller: _controller,
                    onChanged: (value) => streamController.sink.add(value),
                    onSubmitted: onSubmitted,
                    placeholder: "故宫博物馆",
                    placeholderStyle: TextStyle(
                        fontSize: 14, color: Colors.grey, height: 0.8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text("搜索"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        body: StreamBuilder<String>(
          initialData: "",
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.data.length > 0) {
              return _buildSearchBody(snapshot.data);
            } else {
              return _buildDefaultBody();
            }
          },
        ));
  }

  void onSubmitted(String value) {}
}

class TextTag extends StatelessWidget {
  TextTag({@required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => TestPage(
                content: tag,
              ))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.grey[100],
          child: Text(
            tag,
          ),
        ),
      ),
    );
  }
}
