import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/src/tabScaffold.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    print("loginPage build");
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Icon(
              Icons.account_box,
              size: 100,
            )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "手机号/身份证号/残疾号",
                  labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye, color: Colors.grey,), onPressed: () {},),
                  labelText: "密码",
                  labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("登录"),
                  textColor: Colors.white,
                  onPressed: () => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => TabScaffold())),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                ),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Text("没有账号？", style: TextStyle(fontSize: 12),),
                InkWell(
                  child: Text("去注册", style: TextStyle(color: Colors.green, fontSize: 12),),
                ),
                Expanded(child: Container(),),
                InkWell(
                  child: Text("忘记密码？", style: TextStyle(color: Colors.green, fontSize: 12),),
                ),
                SizedBox(width: 5,),
              ],
            ),
            Expanded(child: Container(),),
            SafeArea(child: Text("登录即代表同意行行指导", style: TextStyle(fontSize: 12),))
          ],
        ),
      ),
    );
  }
}
