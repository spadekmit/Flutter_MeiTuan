import 'dart:async';

import 'package:flutter/material.dart';

class SlidesShowWidget extends StatefulWidget {
  @override
  _SlidesShowWidgetState createState() => _SlidesShowWidgetState();
}

class _SlidesShowWidgetState extends State<SlidesShowWidget>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  TabController _tabController;
  Timer _timer;
  int _index = 0;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 2), _handleTimeout);
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget _buildImage(String imageUrl) {
      return Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 30.0, bottom: 0.0),
      height: 120.0,
      child: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: _handlePageChanged,
            controller: _pageController,
            children: <Widget>[
              _buildImage("http://5b0988e595225.cdn.sohucs.com/images/20171105/2e36a4b9c5764a5cb1b6a7ee84f85146.jpeg"),
              _buildImage("https://b-ssl.duitang.com/uploads/item/201602/17/20160217155320_FUCuw.thumb.700_0.jpeg"),
              _buildImage("http://img3.duitang.com/uploads/item/201505/27/20150527174204_aThSR.jpeg"),
              _buildImage("http://5b0988e595225.cdn.sohucs.com/images/20171105/2e36a4b9c5764a5cb1b6a7ee84f85146.jpeg"),
              _buildImage("https://b-ssl.duitang.com/uploads/item/201602/17/20160217155320_FUCuw.thumb.700_0.jpeg"),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Opacity(
                opacity: 0.5,
                child: TabPageSelector(
                  indicatorSize: 10.0,
                  color: Colors.white,
                  selectedColor: Colors.blue,
                  controller: _tabController,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _handleTimeout(Timer timer) {
    _index++;
    _pageController.animateToPage(_index % 3,
        duration: Duration(microseconds: 16), curve: Curves.fastOutSlowIn);
    _tabController.animateTo(_index % 3);
  }

  void _handlePageChanged(int value) {
    _index = value;
    if (value == 0) {
      _tabController.animateTo(_tabController.length - 1);
      _pageController.jumpToPage(5 - 2);
    } else if (value == 5 - 1) {
      _tabController.animateTo(0);
      _pageController.jumpToPage(1);
    } else {
      _tabController.animateTo(value - 1);
    }
  }
}