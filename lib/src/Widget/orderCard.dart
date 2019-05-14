import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {

  OrderCard({@required this.protraitUrl, @required this.title, @required this.state, @required this.imageUrl});

  final String protraitUrl;
  final String title;
  final String state;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Image.network(" "),
              ),
              Text(""),
            ],
          )
        ],
      ),
    );
  }
}
