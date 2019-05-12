import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Style/MyTextStyle.dart';

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
            text: _price, style: TextStyle(fontSize: 15.0, color: Colors.red)),
        TextSpan(
            text: " 起", style: TextStyle(fontSize: 10.0, color: Colors.black))
      ]),
    );
  }
}

class MyTag extends StatelessWidget {
  MyTag({@required this.tag, this.isEmphasize = false});

  final String tag;
  final bool isEmphasize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: new Border.all(color: Colors.black, width: 0.5),
        borderRadius: new BorderRadius.circular((3.0)),
      ),
      child: Text(
        " " + tag + " ",
        style: TextStyle(fontSize: 8.0),
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
      this.tags = const <String>[]})
      : assert(imageUrls.length == 3);

  final Widget price;
  final List<String> tags;
  final String title;
  final List<String> imageUrls;
  final String score;
  final String address;

  @override
  Widget build(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width - 60.0) / 3.0;
    final imageHeight = imageWidth - 20.0;
    final tagList = <Widget>[
      price,
    ];

    if (tags.length > 0) {
      tags.forEach((str) {
        tagList.add(SizedBox(
          width: 5.0,
        ));
        tagList.add(MyTag(
          tag: str,
        ));
      });
    }

    return Container(
      height: 220.0,
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: CardTitleTextStyle,
                  ),
                  Icon(
                    Icons.highlight_off,
                    size: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 7.0,
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
              )
            ],
          ),
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
      this.tags = const <String>[]})
      : assert(imageUrls.length == 3);

  final Widget price;
  final List<String> tags;
  final String title;
  final List<String> imageUrls;
  final String content;
  final String address;

  @override
  Widget build(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width - 60.0) / 3.0;
    final imageHeight = imageWidth - 20.0;
    final tagList = <Widget>[
      price,
    ];

    if (tags.length > 0) {
      tags.forEach((str) {
        tagList.add(SizedBox(
          width: 5.0,
        ));
        tagList.add(MyTag(
          tag: str,
        ));
      });
    }

    return Container(
      height: 340.0,
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
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
                  Icon(
                    Icons.highlight_off,
                    size: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),

              ///套餐包含与地址
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    content,
                    style: BehindGradeTextStyle,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
