
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget builderDrawerLayout(BuildContext context,StateSetter setState)
{

  return Container(
    color: Color(0xffFCFCFC),
    width: 0.75*MediaQuery.of(context).size.width,
    child: new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(

              padding: EdgeInsets.zero,child:
          new ListTile(

            title: Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.06),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/LoGo.png")
                  )
              ),
            ),

          ),
          ),


//        new ListTile(
//          leading: new Icon(Icons.shopping_cart),
//          title: new Text('محصوبلت',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//          onTap: (){},
//        ),


          new SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          new ListTile(
            leading: SvgPicture.asset('assets/images/Combine.svg',color: Color(0xff66738F),),
            title: new Text('Dashboard',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
              // Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
          new ListTile(
            leading: SvgPicture.asset('assets/images/foulder.svg',color: Color(0xff66738F),),
            title: new Text('My Courses',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ), new ListTile(
            leading: SvgPicture.asset('assets/images/Calender.svg',color: Color(0xff66738F),),
            title: new Text('Schedule',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),new ListTile(
            leading: SvgPicture.asset('assets/images/editquare.svg',color: Color(0xff66738F),),
            title: new Text('Homework',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),new ListTile(
            leading: SvgPicture.asset('assets/images/document.svg',color: Color(0xff66738F),),
            title: new Text('Quizes',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),new ListTile(
            leading: SvgPicture.asset('assets/images/wallet.svg',color: Color(0xff66738F),),
            title: new Text('Transactions',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),new ListTile(
            leading: SvgPicture.asset('assets/images/chat.svg',color: Color(0xff66738F),),
            title: new Text('Support',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),new ListTile(
            leading: SvgPicture.asset('assets/images/Activity.svg',color: Color(0xff66738F),),
            title: new Text('Marks',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),new ListTile(
            leading: SvgPicture.asset('assets/images/Setting.svg',color: Color(0xff66738F),),
            title: new Text('Setting',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
            onTap: (){
            },
          ),
        ],
      ),
    ),
  );
}