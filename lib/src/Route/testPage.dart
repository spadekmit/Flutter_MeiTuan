import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Container(
          height: 40,
          child: TextField(
              autofocus: true,
              style: TextStyle(fontSize: 14),
              maxLines: 1,
            ),
        ),
      ),
    );
  }
}
