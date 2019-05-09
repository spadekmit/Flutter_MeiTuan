import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.black,),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
            Container(child: Text("三河", style: TextStyle(color: Colors.black),), padding: const EdgeInsets.all(8),),
            Expanded(
              child: Container(color: Colors.grey[200], margin: EdgeInsets.only(bottom: 10),),
            ),

          ],
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            icon: Icon(Icons.add, color: Colors.black,),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
