import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meituan/src/Route/searchPage.dart';
import 'package:flutter_meituan/src/Route/testPage.dart';
import 'package:flutter_meituan/src/Style/myTheme.dart';
import 'package:flutter_meituan/src/Widget/commonWidget.dart';
import 'package:flutter_meituan/src/Widget/recommendedCard.dart';
import 'package:flutter_meituan/src/Widget/slidesShow.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.screenWidth});

  final double screenWidth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  List<Widget> _list;
  ScrollController _controller;
  bool isRefreshing;
  Widget _selectedItem;

  @override
  void initState() {
    super.initState(); //调用父类的initState方法
    isRefreshing = false;
    _controller = ScrollController();
    _controller.addListener(() {
      //给ScrollController添加监听器
      if (_controller.position.pixels == _controller.position.maxScrollExtent &&
          !this.isRefreshing) {
        //当滚动到底部且不在加载中时
        setState(() {
          isRefreshing = true; //设置当前状态为正在加载中
          Widget item = Container(
            //一个IOS风格的加载中的指示器
            height: 50,
            child: Center(child: CupertinoActivityIndicator()),
          );
          _selectedItem = item; //设置当前选中的控件为该指示器，方便加载完后删除指示器
          _insertItem(_list.length, item); //添加该指示器到底部
        });

        Future.delayed(Duration(seconds: 2), () {
          //两秒后执行传入的方法
          _removeItem(_list.length - 1); //删除指示器并添加三个推荐卡片
          _insertItem(_list.length, _buildCard1());
          _insertItem(_list.length, _buildCard2());
          _insertItem(_list.length, _buildCard3());
          setState(() {
            isRefreshing = false; //设置当前状态为不在加载中
          });
        });
      }
    });
    _list = <Widget>[
      //第一次加载HomePage时初始化三个推荐卡片
      _buildCard1(),
      _buildCard2(),
      _buildCard3(),
    ];
  }

  void _removeItem(int index) {
    _list.removeAt(index); //从控件列表中移除对应索引位置的控件
    _listKey.currentState.removeItem(
        //从key中移除对应索引位置的控件并通过_buildRemovedItem方法显示一个移除的动画
        index + 6,
        (context, animation) =>
            _buildRemovedItem(_selectedItem, context, animation));
  }

  void _insertItem(int index, Widget item) {
    _list.insert(index, item); //从控件列表和key中添加一个控件
    _listKey.currentState.insertItem(index + 6);
  }

  //构建被移除的控件（显示移除动画）
  Widget _buildRemovedItem(
      Widget widget, BuildContext context, Animation<double> animation) {
    return SizeTransition(    //封装有尺寸变化动画的控件
      axis: Axis.vertical,
      sizeFactor: animation,
      child: widget,
    );
  }

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
            InkWell(
              borderRadius: BorderRadius.circular(45),
              onTap: () => Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => TestPage())),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipOval(
                  child: Image.asset("images/protrait.png",
                      width: 35.0, height: 35.0),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => TestPage())),
              child: Container(
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
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => SearchPage()));
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
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton(
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black,
                ),
                itemBuilder: (context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.image),
                            SizedBox(
                              width: 20,
                            ),
                            Text("扫一扫"),
                          ],
                        )),
                      ),
                      PopupMenuItem(
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.scanner),
                            SizedBox(
                              width: 20,
                            ),
                            Text("付款码"),
                          ],
                        )),
                      ),
                    ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //推荐卡片中关闭对话框里的圆角边框按钮
  Widget _buildMyButton(String title) {
    return GestureDetector(
      onTap: () {
        _removeItem(_list.indexOf(_selectedItem));
        Navigator.of(context).pop();
      },
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //显示推荐卡片的关闭对话框
  void _showDeleteDialog(Widget selectedItem) {
    _selectedItem = selectedItem;
    var dialog = SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: EdgeInsets.only(top: 20),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "选择具体理由，会减少相关推荐呦",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildMyButton("去过了"),
              SizedBox(
                width: 10,
              ),
              _buildMyButton("不感兴趣"),
              SizedBox(
                width: 10,
              ),
              _buildMyButton("价格不合适"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              _removeItem(_list.indexOf(_selectedItem));
              Navigator.of(context).pop();
            },
            child: InkWell(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Center(
                  child: Text(
                    "不感兴趣",
                    style: TextStyle(fontSize: 12, color: Colors.teal),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }

  //构建一行功能按钮
  List<Widget> _buildTitle(
      List<String> strs, List<String> urls, List<String> tips, double width) {
    List<Widget> titleList = <Widget>[];
    for (int i = 0; i < strs.length; i++) {
      titleList.add(Flexible(
        flex: 1,
        child: MyImageButton(
          image: Image.asset(
            urls[i],
            width: width,
            height: width,
          ),
          title: strs[i],
          tip: tips[i],
        ),
      ));
    }
    return titleList;
  }

  //构建需要显示的控件
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: _list[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodys = _initBody();    //顶部三行标题栏及轮播图等不会被删除的控件，因含有用于分隔的SizedBox控件，所以总长度为6
    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: Container(
        decoration: GradientDecoration,   //定义在主题文件中的渐变色装饰器
        child: AnimatedList(
          controller: _controller,    //绑定滚动控制器，key等
          key: _listKey,
          initialItemCount: bodys.length + _list.length,  //初始化时的控件总长度
          itemBuilder: (context, index, animation) {     //当子控件要可见时调用该方法构建控件
            if (index > 5) {     //索引大于5时显示_list列表中的推荐卡片，否则bodys中的控件。
              return _buildItem(context, index - bodys.length, animation);
            } else {
              return bodys[index];
            }
          },
        ),
      ),
    );
  }

  //构建推荐卡片
  Widget _buildCard1() {
    return ScenicCard(
      onDelete: _showDeleteDialog,
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
    );
  }

  Widget _buildCard2() {
    return BigPictureCateCard(
      onDelete: _showDeleteDialog,
      title: "老北京涮肉 4 人餐",
      content: "套餐包括：羔羊肉，肥牛，香辣锅，鱼丸，炸灌肠，...",
      address: "南锣鼓巷",
      price: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: "￥", style: TextStyle(fontSize: 10.0, color: Colors.red)),
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
    );
  }

  Widget _buildCard3() {
    return ScenicCard(
      onDelete: _showDeleteDialog,
      price: Text(
        "免费",
        style: TextStyle(
            color: Colors.red, fontSize: 12.0, fontWeight: FontWeight.bold),
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
    );
  }

  //构建首页中不能被删除的头部
  List<Widget> _initBody() {
    final screenWidth = widget.screenWidth; //按照当前设备屏幕宽度调整图标大小
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

    const tip1 = <String>[null, null, "嗨抢", "网咖", null];

    const tip2 = <String>[null, null, "早订", null, null];

    const tip3 = <String>[null, null, null, null, null];

    return <Widget>[
      //第一行标题栏
      Container(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, bottom: 5.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildTitle(title1, url1, tip1, screenWidth / 7),
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
          children: _buildTitle(title2, url2, tip2, screenWidth / 14.0),
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
          children: _buildTitle(title3, url3, tip3, screenWidth / 14.0),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 30.0, bottom: 0.0),
          child: SlidesShowWidget(
            height: 80,
          )),
    ];
  }
}
