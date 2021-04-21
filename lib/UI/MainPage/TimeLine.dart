import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:uniqmaster_project/UI/MainPage/AppBar.dart';
import 'package:mk_drop_down_menu/mk_drop_down_menu.dart';
import 'package:intl/intl.dart';

class TimeLinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TimeLinePageState();

}
class TimeLinePageState extends State<TimeLinePage>{
  DateTime now = DateTime.now();
  DateTime date ;
  bool _DayWeekToggle ;
  int curSelectedIndex ;
  @override
  void initState() {
    curSelectedIndex = 0;
    _DayWeekToggle = false;
    // TODO: implement initState
    date = DateTime(now.year, now.month, now.day);
    super.initState();
  }
  var moods = ['Day' , 'Week'];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: MyAppBar(contextp: context,),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  // margin: EdgeInsets.only(left: ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Color(0xffF7F7FC)),
                  height: 50,

                  width: MediaQuery.of(context).size.width*0.3,
                  child: Expanded(
                    child: DropdownButton<String>(
                      underline: Container(),
                      isExpanded: true,
                      value: moods[curSelectedIndex],
                      onChanged: (String newValue) {
                        setState(() {
                          for(int i = 0 ; i < moods.length ; i++)
                            if (moods[i] == newValue)
                              curSelectedIndex = i;
                        });
                      },
                      items: moods.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            (value ?? "") ,
                            style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize*1.3,fontFamily: 'Poppins' , fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              curSelectedIndex == 0 ? DayView(
                date: now,

                dayBarStyle: DayBarStyle(

                  dateFormatter: (year,month,day) => DateFormat.MMMMd('en_US').format(DateTime(year,month,day)).toString()   ,
                  textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: MediaQuery.of(context).size.width*0.045,fontFamily:'Poppins'),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xff6D07CB),Color(0xffEFADFF )]),
                    borderRadius: BorderRadius.circular(30)
                  )

                ),
                inScrollableWidget: false,
                userZoomable: false,

                events: [
                  FlutterWeekViewEvent(
                    title: 'Programming Basics',
                    description: 'Webinar Course',
                    start: date.add(Duration(hours: 1,minutes: 0)),
                    end: date.add(Duration(hours: 2, minutes: 30)),
                    textStyle: TextStyle(color: Color(0xff4E4B66)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xffDFFFF6)
                    )
                  ),
                  FlutterWeekViewEvent(
                    title: 'Programming Basics',
                    description: 'Quiz',
                    start: date.add(Duration(hours: 10)),
                    end: date.add(Duration(hours: 12)),
                      textStyle: TextStyle(color: Color(0xff4E4B66)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffFFF4DF)
                      )
                  ),
                  FlutterWeekViewEvent(
                    title: 'An event 3',
                    description: 'A description 3',
                    start: date.add(Duration(hours: 3, minutes: 30)),
                    end: date.add(Duration(hours: 5, minutes: 0)),
                      textStyle: TextStyle(color: Color(0xff4E4B66)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffFFDFED)
                      )
                  ),
                  FlutterWeekViewEvent(
                    title: 'An event 4',
                    description: 'A description 4',
                    start: date.add(Duration(hours: 5,minutes: 30)),
                    end: date.add(Duration(hours: 7,minutes: 30)),
                      textStyle: TextStyle(color: Color(0xff4E4B66)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffDEF9FF)
                      )
                  ),

                ],
                style: DayViewStyle(

                  backgroundColor: Color(0xffFCFCFC),
                  headerSize: 50,

                )
              ) : Container(),
            ],
          ),
        )

      );

  }

}