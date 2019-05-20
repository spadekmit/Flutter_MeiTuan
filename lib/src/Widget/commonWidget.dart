import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Style/myTheme.dart';

Widget _buildImage(double width, double height, String url) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
      url,
      fit: BoxFit.fitHeight,
      width: width,
      height: height,
    ),
  );
}

class MyImageButton extends StatelessWidget {
  MyImageButton(
      {@required this.image, @required this.title, this.width, this.tip});

  final Widget image;
  final String title;
  final double width;
  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                image,
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 12.0),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: tip != null
                ? MyTag(
                    tag: tip,
                    isEmphasize: true,
                    radius: 15.0,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class PriceText extends StatelessWidget {
  PriceText(this._price);

  final String _price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "￥", style: TextStyle(fontSize: 10.0, color: Colors.red)),
        TextSpan(
            text: _price,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: " 起", style: TextStyle(fontSize: 10.0, color: Colors.black))
      ]),
    );
  }
}

class MyTag extends StatelessWidget {
  MyTag({@required this.tag, this.isEmphasize = false, this.radius = 3.0});

  final String tag;
  final bool isEmphasize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: isEmphasize ? Colors.red : Colors.black, width: 0.5),
        color: isEmphasize ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular((radius)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
        child: Text(
          tag,
          style: TextStyle(
              fontSize: 10.0, color: isEmphasize ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class ScenicCard extends StatelessWidget {
  ScenicCard(
      {@required this.price,
      @required this.title,
      @required this.imageUrls,
      @required this.score,
      @required this.address,
      this.onPress,
      this.tags = const <Widget>[]})
      : assert(imageUrls.length == 3);

  final Widget price;
  final List<Widget> tags;
  final String title;
  final List<String> imageUrls;
  final String score;
  final String address;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width - 60.0) / 3.0;
    final imageHeight = imageWidth - 20.0;
    final tagList = <Widget>[
      price,
    ];

    if (tags.length > 0) {
      tags.forEach((tag) {
        tagList.add(SizedBox(
          width: 5.0,
        ));
        tagList.add(tag);
      });
    }

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //粗体标题
                Text(
                  title,
                  style: CardTitleTextStyle,
                ),
                //卡片删除图标
                Container(
                  height: 20,
                  width: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.highlight_off,
                      size: 20.0,
                    ),
                    onPressed: onPress,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Text(
                  score,
                  style: GradeTextStyle,
                ),
                Text(
                  address,
                  style: BehindGradeTextStyle,
                )
              ],
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              children: tagList,
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildImage(imageWidth, imageHeight, imageUrls[0]),
                _buildImage(imageWidth, imageHeight, imageUrls[1]),
                _buildImage(imageWidth, imageHeight, imageUrls[2]),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class BigPictureCateCard extends StatelessWidget {
  BigPictureCateCard(
      {@required this.price,
      @required this.title,
      @required this.imageUrls,
      @required this.content,
      @required this.address,
      this.onPress,
      this.tags = const <Widget>[]})
      : assert(imageUrls.length == 3);

  final Widget price;
  final List<Widget> tags;
  final String title;
  final List<String> imageUrls;
  final String content;
  final String address;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width - 60.0) / 3.0;
    final imageHeight = imageWidth - 20.0;
    final tagList = <Widget>[
      price,
    ];

    if (tags.length > 0) {
      tags.forEach((tag) {
        tagList.add(SizedBox(
          width: 5.0,
        ));
        tagList.add(tag);
      });
    }

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///标题
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: CardTitleTextStyle,
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.highlight_off,
                      size: 20.0,
                    ),
                    onPressed: onPress,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            ///套餐包含与地址
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    content,
                    style: BehindGradeTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  address,
                  style: BehindGradeTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 7.0,
            ),

            ///价格与标签
            Row(
              children: tagList,
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildImage(imageWidth * 2, imageHeight * 2, imageUrls[0]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildImage(imageWidth, imageHeight, imageUrls[1]),
                    _buildImage(imageWidth, imageHeight, imageUrls[2]),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
