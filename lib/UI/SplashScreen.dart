import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() =>SplashScreenState();

}

class SplashScreenState extends State<SplashScreen>
{
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  startTime()
  {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, NavigationPage);
  }
  NavigationPage()
  {
    Navigator.pushReplacementNamed(context, '/Home');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   startTime();
  }
  @override
  Widget build(BuildContext context) {
    return new Directionality(textDirection: TextDirection.rtl, child: new Scaffold(
        key: _scaffoldKey,
        backgroundColor: new Color(0xff075E54),
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 100,
                  height: 100,
                  decoration: new BoxDecoration(

                    image: new DecorationImage(image: new AssetImage("assets/images/uniqmaster-l2ogo.png"),),

                  ),
                ),
                new Padding(padding: EdgeInsets.symmetric(vertical: 13)),
                new Text("یونیک مستر",style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),)
              ],

            ),
            new Padding(padding: EdgeInsets.only(bottom: 18),child: new Align(
              alignment: Alignment.bottomCenter,
              child: new CircularProgressIndicator(),
            ),)

          ],
        )
    ),
    );
  }


}