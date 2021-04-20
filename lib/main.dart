import 'package:flutter/material.dart';
import 'package:uniqmaster_project/UI/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uniqe Master',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        highlightColor: Colors.black45,
        accentColor: Colors.black12,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreen(),
      },
    );
  }
}

