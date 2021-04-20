import 'package:badges/badges.dart';
import 'package:flutter/material.dart' ;
import 'package:cached_network_image/cached_network_image.dart';
class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  BuildContext contextp;

  MyAppBar({this.contextp}) ;
  @override
  Widget build(BuildContext context) {
  var height = MediaQuery.of(contextp).size.height;
    return AppBar(
      iconTheme: IconThemeData(color: Color(0xff66738F)),
      backgroundColor: Color(0xffFCFCFC),
      elevation: 0.0,

      shadowColor: Colors.transparent,
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
//            if(back)
//             GestureDetector(
//                child: new Icon(Icons.arrow_back,color: color == Colors.grey ? Color.fromARGB(255, 0, 71, 93) : Colors.white, size: 27,),
//              onTap: () {
//                  Navigator.of(context).pop();
//              },
//            ),
          new SizedBox(width: 0,),
          new Text("Dashboard",style: TextStyle(color:Color(0xff66738F), fontWeight: FontWeight.w700
          ))
        ],
      ),
       actions: [

//         Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle
//           ),
//           child:    new CachedNetworkImage(
//             imageUrl: "https://www.bradfieldconsulting.net/wp-content/uploads/2019/08/avatar-man.png",
//             placeholder: (context, url) => CircleAvatar(
//               backgroundColor: Colors.grey,
//             ),
//           ),
//         ),
      new Container(
      height: 0.06 * height,
      width: 0.06 * height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        image: DecorationImage(
          image: AssetImage("assets/images/Avatar.png")
        )
      ),
    ),
        new SizedBox(width: 10,),
      ],
      automaticallyImplyLeading: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.of(contextp).size.height * 0.08);

}