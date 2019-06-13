import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_meituan/src/data/searchData.dart';
import 'package:flutter_meituan/src/language/chineseCupertinoLocalizations.dart';
import 'package:flutter_meituan/src/route/logInPage.dart';
import 'package:flutter_meituan/src/tabScaffold.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((context) => SearchData()));
  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));

  ///如果是安卓平台，将状态栏颜色设为透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ChineseCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('zh'), // Chinese
      ],
      home: FutureBuilder<bool>(
        future: _isConfirmed(),
        builder: (context, snap) {
          switch (snap.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Container(child: CupertinoActivityIndicator(),);
              break;
            case ConnectionState.done:
              print("in done");
              return snap.data ?  TabScaffold() : LogInPage();
              break;
          }
            
        },
      ),
    );
  }

  Future<bool> _isConfirmed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("pwd");
  }
}
