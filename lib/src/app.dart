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
    HomePage(),
    FindPage(),
    OrderPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text("首页")),
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
      body: bodys[_selectedIndex],
    );
  }
}
