import 'package:flutter/material.dart';

class DropDownMenuButton extends StatelessWidget {
  DropDownMenuButton(
      {@required this.label,
      this.isActivity = false,
      this.iconActivity = false,
      this.onPress});

  final String label;
  final VoidCallback onPress;
  final bool isActivity;
  final bool iconActivity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.green,
      onTap: onPress,
      child: Card(
        elevation: 0,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    color: isActivity ? Colors.green : Colors.black,
                    fontSize: 13),
              ),
              Icon(
                iconActivity
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: isActivity ? Colors.green : Colors.black,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableButton extends StatelessWidget {
  SelectableButton(
      {@required this.tag,
      this.width = 80,
      this.height = 40,
      this.onTap,
      this.isActivity = false});

  final double width;
  final double height;
  final bool isActivity;
  final String tag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        child: Card(
          elevation: 0.0,
          color: Colors.grey[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                tag,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    color: isActivity ? Colors.teal : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
