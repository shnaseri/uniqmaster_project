

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniqmaster_project/UI/MainPage/AppBar.dart';
import 'package:uniqmaster_project/UI/MainPage/Drawer.dart';

class AppMainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new AppMainPageState();

}

class AppMainPageState extends State<AppMainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(contextp: context,),
      drawer: builderDrawerLayout(context,setState),
      body:Center(
        child: new Container(

          width : MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
          height: MediaQuery.of(context).size.height*0.4,
          decoration: new BoxDecoration(

            image: new DecorationImage(image: new AssetImage("assets/images/uniqmaster_l2ogo.png"),fit: BoxFit.fitWidth),

          ),
        ),
      ),
    );
  }
}