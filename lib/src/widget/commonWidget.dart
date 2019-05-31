import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/route/testPage.dart';

class MyImageButton extends StatelessWidget {
  MyImageButton({@required this.image, @required this.title, this.tip});

  final Widget image;
  final String title;
  final String tip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => TestPage(
                content: title,
              ))),
      splashColor: Colors.grey,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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

class TextTag extends StatelessWidget {
  TextTag({@required this.tag, this.padding = const EdgeInsets.all(5), this.radius = 5, this.onTap});

  final String tag;
  final EdgeInsets padding;
  final double radius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: padding,
          //EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.grey[100],
          child: Text(
            tag,
          ),
        ),
      ),
    );
  }
}

Widget buildFakeSearchBox(IconData icon, String label) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(45.0))),
    color: CupertinoColors.lightBackgroundGray,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey, height: 0.8),
          )
        ],
      ),
    ),
  );
}

