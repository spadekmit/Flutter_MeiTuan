import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/Widget/recommendedCard.dart';

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

class ListModel<Widget> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<Widget> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<Widget>.from(initialItems ?? <Widget>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<Widget> _items;

  AnimatedListState get _animatedList => listKey.currentState;
  int get length => _items.length;
  Widget operator [](int index) => _items[index];
  int indexOf(Widget item) => _items.indexOf(item);

  void insert(int index, Widget item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  Widget removeAt(int index) {
    final Widget removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  Widget removeByIndex(int index) {
    int rIndex;
    for (int i = 6; i < _items.length; i++) {
      RecommendedCard card = _items[i] as RecommendedCard;
      if (card.index == index) {
        rIndex = i;
      }
    }
    final Widget removedItem = _items.removeAt(rIndex);
    if (removedItem != null) {
      _animatedList.removeItem(rIndex,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }
}