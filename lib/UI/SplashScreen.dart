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
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, NavigationPage);
  }
  void NavigationPage()
  {
    Navigator.pushReplacementNamed(context, '/Home');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  print('ok');
   startTime();
  }
  @override
  Widget build(BuildContext context) {
    return new Directionality(textDirection: TextDirection.rtl, child: new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: new Container(

                    width : MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                    height: MediaQuery.of(context).size.height*0.4,
                    decoration: new BoxDecoration(

                      image: new DecorationImage(image: new AssetImage("assets/images/uniqmaster_l2ogo.png"),fit: BoxFit.fitWidth),

                    ),
                  ),
                ),
                new Padding(padding: EdgeInsets.symmetric(vertical: 13)),
                // new Text("Uniqe Master",style: TextStyle(fontSize: 27,color: Color(0xffD423FD),fontWeight: FontWeight.bold),)
              ],

            ),
            new Padding(padding: EdgeInsets.only(bottom: 18),child: new Align(
              alignment: Alignment.bottomCenter,
              child: new CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff6D0DCC)),),
            ),)

          ],
        )
    ),
    );
  }


}