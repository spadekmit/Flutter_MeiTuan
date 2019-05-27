import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  OrderCard(
      {@required this.protraitUrl,
      @required this.title,
      @required this.state,
      @required this.imageUrl,
      @required this.infos});

  final String protraitUrl;
  final String title;
  final String state;
  final String imageUrl;
  final List<String> infos;

  @override
  Widget build(BuildContext context) {

    var cardWidth = MediaQuery.of(context).size.width / 6;
    List<Widget> informations = <Widget>[];

    if (infos.length > 0) {
      infos.forEach((str) {
        informations.add(
          Text(str, style: TextStyle(fontSize: 13.0),)
        );
      });
    }

    return Card(
      elevation: 0.0,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    protraitUrl,
                    height: 20.0,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(title),
                Expanded(
                  child: Container(),
                ),
                Text(state, style: TextStyle(fontSize: 13.0),),
              ],
            ),
            Divider(),
            SizedBox(height: 5.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    imageUrl,
                    width: cardWidth,
                    height: cardWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: informations,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 80.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: 0.5),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((10.0)),
                ),
                child: Center(child: Text(" 再来一单 ")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
