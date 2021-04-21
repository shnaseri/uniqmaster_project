import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uniqmaster_project/UI/MainPage/AppBar.dart';
// import 'package:intl/intl.dart';
class CalenderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CalenderPageFull();

}
class Event {
  final String title;
  final DateTime datesave;
  final String Category;
  const Event(this.title,this.datesave,this.Category);

  @override
  String toString() => title;
}
class CalenderPageFull extends State<CalenderPage>{
  final Set<DateTime> _selectedDays = new Set<DateTime>();
  final Set<DateTime> _holidays = new Set<DateTime>();

  ValueNotifier<List<Event>> _selectedEvents;
   ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  CalendarFormat _calendarFormatweek = CalendarFormat.month;

  var Category;


  int getHashCode(DateTime key) {
    if(key != null){
    return key.day * 1000000 + key.month * 10000 + key.year;
    }
  }
  var kEvents = LinkedHashMap<DateTime, List<Event>>();
  var _kEventSource ;
  @override
  void initState() {

    // TODO: implement initState
    _selectedDays.add(_focusedDay.value);
    super.initState();
    Category = ['Programming Basics' , 'Java Programming' ];

    _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
        key: (item) => DateTime(2021,4,item*5,8,0),
        value: (item) => List.generate(
            item % 4 + 1, (index) => Event('${Category[item%2]}' ,  DateTime(2021,4,item*5,8,0) ,'One-to-One Class' )))
      ..addAll({
        DateTime.now(): [
          Event('Programming Basics',DateTime.now(),'Webinar Course'),
          Event('Java Programming' , DateTime.now(),'Video Course'),
        ],
      });
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
     kEvents = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_kEventSource);
     for(final data in kEvents.entries){
       var datetime = DateTime.utc(data.key.year,data.key.month,data.key.day);
        var stringdate = datetime.toString();
        _holidays.add(DateTime.parse(stringdate));
     }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay)  {
    setState(() {
      // print(_selectedDays);
      // print(_holidays);
      _selectedDays.clear();
      _focusedDay.value = selectedDay;
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
        
      } else {
        _selectedDays.add(selectedDay);
      }
    });

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(contextp: context,),
        body:  Column(
          children: [

            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.025),
              child: Align(child: new Text('Calendar',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),alignment: Alignment.centerLeft,),
            ),
            Divider(color: Color(0xffEFF0F6),thickness: 5,),


            Padding(
              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01,left:MediaQuery.of(context).size.width*0.02,right: MediaQuery.of(context).size.width*0.02 ),
              child: TableCalendar(

                  firstDay: DateTime.utc(2000,1,1),
                  lastDay: DateTime.utc(2030,1,1),
                  focusedDay: _focusedDay.value,
                  headerVisible: true,
                selectedDayPredicate:  (day) => _selectedDays.contains(day),
                onDaySelected: _onDaySelected,
                holidayPredicate: (day) => _holidays.contains(DateTime.parse(day.toString())),
                headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Poppins',fontSize: MediaQuery.of(context).size.width*0.042),
                      titleCentered: true,
                      headerMargin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02, horizontal: MediaQuery.of(context).size.width*0.2),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: Color(0xffEFF0F6)
                      ),
                      formatButtonVisible: false
                ),

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Color(0xffF4B740) , fontFamily: 'Poppins' , fontWeight: FontWeight.w600),
                      weekendStyle: TextStyle(color: Color(0xffF4B740) , fontFamily: 'Poppins' , fontWeight: FontWeight.w600)
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                        color: Color(0xff0096B7)
                  ),
                  holidayDecoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF4B740)),
                        borderRadius: BorderRadius.circular(10)
                  ),
                  defaultDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6)
                  ),
              weekendDecoration: BoxDecoration(

              ),

              selectedDecoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xff6D07CB),Color(0xffEFADFF )]),
                    borderRadius: BorderRadius.all(Radius.circular(6)),

                color: Colors.grey
              ),

                    cellMargin:EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                ),

              ),


            ),
            new SizedBox(height: 5,),
            Divider(color: Color(0xffEFF0F6),thickness: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(child: new Text('Upcoming plans',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),alignment: Alignment.centerLeft,),
            ),
            Expanded(child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  var color = [0xffED2E7E,0xff00BA88];
                  return ListView.builder(

                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: 70,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffF7F7FC),
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              trailing: Text(value[index].datesave.hour.toString() + ":" + value[index].datesave.minute.toString() +' AM', style: TextStyle(fontWeight: FontWeight.w700,),textDirection: TextDirection.ltr,),
                              title: IntrinsicHeight(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      VerticalDivider(thickness: 4,color: Color(color[index%2]),width: 20,),
                                      new SizedBox(width: 4,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${value[index]}',style: TextStyle(fontWeight: FontWeight.w600),),
                                          Text(value[index].Category,style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xffA0A3BD)),),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  );
                }
            ))
          ],
        )
    );
  }

}