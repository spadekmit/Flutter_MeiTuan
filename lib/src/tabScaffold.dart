import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Route/findPage.dart';
import 'package:flutter_meituan/src/Route/homePage.dart';
import 'package:flutter_meituan/src/Route/orderPage.dart';
import 'package:flutter_meituan/src/Route/userPage.dart';

class TabScaffold extends StatefulWidget {
  @override
  _TabScaffoldState createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  int _selectedIndex = 0;

  final bodys = [
    HomePage(),     //home界面
    FindPage(),     //发现界面
    OrderPage(),    //订单界面
    UserPage(),     //用户界面
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,    //底部导航栏背景色
        activeColor: Colors.teal,         //被选中的tabbar背景色
        currentIndex: _selectedIndex,     //当前被选中的tabbar的序号
        onTap: (index) {      //tabbar点击事件
          setState(() {
            _selectedIndex = index;     //将当前被选中序号更新成被点击的tabbar的序号，并通知界面刷新
          });
        },
        items: const <BottomNavigationBarItem>[   //底部显示的tabbar
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,   //tabbar图标
              ),
              title: Text("首页")),   //tabbar标题
          BottomNavigationBarItem(
              icon: Icon(
                Icons.find_in_page,
              ),
              title: Text("发现")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
              ),
              title: Text("订单")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              title: Text("我的")),
        ],
      ),
      body: bodys[_selectedIndex],    //底部导航栏对应的界面
    );
  }
}
