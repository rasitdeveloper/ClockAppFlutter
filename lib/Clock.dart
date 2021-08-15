import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late FlutterLocalNotificationsPlugin fltrNotifications1;
  late FlutterLocalNotificationsPlugin fltrNotifications2;
  late FlutterLocalNotificationsPlugin fltrNotifications3;
  late TimeOfDay time;
  late TimeOfDay picked;
  DateTime now = new DateTime.now();
  bool visibility1 = true;
  bool visibility2 = true;
  bool visibility3 = true;
  bool v2 = true;
  bool v3 = true;

  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool flag5 = false;
  bool flag6 = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = TimeOfDay.now();
    WidgetsFlutterBinding.ensureInitialized();
    AndroidAlarmManager.initialize();

    var androidInitialize1 = new AndroidInitializationSettings("selectimage");
    var IOSInitialize1 = new IOSInitializationSettings();
    var initilizationsSettings1 = new InitializationSettings(android: androidInitialize1, iOS: IOSInitialize1);
    fltrNotifications1 = new FlutterLocalNotificationsPlugin();
    fltrNotifications1.initialize(initilizationsSettings1, onSelectNotification: (payload) {
      return _notificationSelected1();
    },);

    var androidInitialize2 = new AndroidInitializationSettings("selectimage");
    var IOSInitialize2 = new IOSInitializationSettings();
    var initilizationsSettings2 = new InitializationSettings(android: androidInitialize2, iOS: IOSInitialize2);
    fltrNotifications2 = new FlutterLocalNotificationsPlugin();
    fltrNotifications2.initialize(initilizationsSettings2, onSelectNotification: (payload) {
      return _notificationSelected2();
    },);

    var androidInitialize3 = new AndroidInitializationSettings("selectimage");
    var IOSInitialize3 = new IOSInitializationSettings();
    var initilizationsSettings3 = new InitializationSettings(android: androidInitialize3, iOS: IOSInitialize3);
    fltrNotifications3 = new FlutterLocalNotificationsPlugin();
    fltrNotifications3.initialize(initilizationsSettings3, onSelectNotification: (payload) {
      return _notificationSelected3();
    },);


  }


  Future _setNotification1() async {
    var androidDetails1 = new AndroidNotificationDetails("Channed ID", "Alarm", "Alarm is Done!", importance: Importance.high);
    var IOSDetails1 = new IOSNotificationDetails();
    var generalNotificationDetails1 = new NotificationDetails(android: androidDetails1, iOS: IOSDetails1);
    await fltrNotifications1.schedule(1, "Alarm", "Alarm is Done!", DateTime(now.year, now.month, now.day, time.hour, time.minute), generalNotificationDetails1);
  }

  Future _setNotification2() async {
    var androidDetails2 = new AndroidNotificationDetails("Channed ID", "Alarm", "Alarm is Done!", importance: Importance.high);
    var IOSDetails2 = new IOSNotificationDetails();
    var generalNotificationDetails2 = new NotificationDetails(android: androidDetails2, iOS: IOSDetails2);
    await fltrNotifications2.schedule(2, "Alarm", "Alarm is Done!", DateTime(now.year, now.month, now.day, time.hour, time.minute), generalNotificationDetails2);
  }

  Future _setNotification3() async {
    var androidDetails3 = new AndroidNotificationDetails("Channed ID", "Alarm", "Alarm is Done!", importance: Importance.high);
    var IOSDetails3 = new IOSNotificationDetails();
    var generalNotificationDetails3 = new NotificationDetails(android: androidDetails3, iOS: IOSDetails3);
    await fltrNotifications3.schedule(3, "Alarm", "Alarm is Done!", DateTime(now.year, now.month, now.day, time.hour, time.minute), generalNotificationDetails3);
  }


  Future _notificationSelected1() async {
    showDialog(context: context, builder: (context) => AlertDialog(content: Text("Notification Clicked"),));
    flag1 = false;
    flag2 = false;
  }

  Future _notificationSelected2() async {
    showDialog(context: context, builder: (context) => AlertDialog(content: Text("Notification Clicked"),));
    flag3 = false;
    flag4 = false;
  }

  Future _notificationSelected3() async {
    showDialog(context: context, builder: (context) => AlertDialog(content: Text("Notification Clicked"),));
    flag5 = false;
    flag6 = false;
  }

  Future<Null> selectTime1 (BuildContext context) async {
    picked = (await showTimePicker(context: context, initialTime: time))!;
    setState(() {
      time = picked;
      visibility1 = false;
    });
  }

  Future<Null> selectTime2 (BuildContext context) async {
    picked = (await showTimePicker(context: context, initialTime: time))!;
    setState(() {
      time = picked;
      visibility2 = false;
    });
  }

  Future<Null> selectTime3 (BuildContext context) async {
    picked = (await showTimePicker(context: context, initialTime: time))!;
    setState(() {
      time = picked;
      visibility3 = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/25),
                  child: Offstage(
                      offstage: visibility1,
                      child: Text("Year = " + now.year.toString() + "/" + "Month = " + now.month.toString() + "/" + "Day = " + now.day.toString() + "/" + "Time = " + time.hour.toString() + " : " + time.minute.toString(), style: TextStyle(fontSize: 10),)),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Select Time"),
                    onPressed: () {
                      selectTime1(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Set Alarm"),
                    style: ElevatedButton.styleFrom(primary: flag1 ? Colors.green : Colors.purple),
                    onPressed: () {
                      _setNotification1();
                      setState(() {
                        flag1 = true;
                        flag2 = false;
                      });
                    }
                  ),
                  ElevatedButton(
                    child: Text("Delete Alarm"),
                    style: ElevatedButton.styleFrom(primary: flag2 ? Colors.red : Colors.purple),
                    onPressed: () {
                      fltrNotifications1.cancel(1);
                      setState(() {
                        flag1 = false;
                        flag2 = true;
                      });
                    },
                  )
                ],
              ),
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi/10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: ekranYuksekligi/20,
                    width: ekranGenisligi/10,
                    child: ElevatedButton(
                      child: Text("+"),
                      onPressed: (){
                        setState(() {
                          v2 = false;
                        });
                      },
                    ),
                  ),
                  Offstage(
                    offstage: v2,
                    child: Padding(
                      padding: EdgeInsets.only(top: ekranYuksekligi/10),
                      child: Offstage(
                          offstage: visibility2,
                          child: Text("Year = " + now.year.toString() + "/" + "Month = " + now.month.toString() + "/" + "Day = " + now.day.toString() + "/" + "Time = " + time.hour.toString() + " : " + time.minute.toString(), style: TextStyle(fontSize: 10),)),
                    ),
                  ),
                  Offstage(
                    offstage: v2,
                    child: SizedBox(
                      height: ekranYuksekligi/20,
                      width: ekranGenisligi/10,
                      child: ElevatedButton(
                        child: Text("-"),
                        onPressed: (){
                          setState(() {
                            v2 = true;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Offstage(
              offstage: v2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Select Time"),
                    onPressed: () {
                      selectTime2(context);
                    },
                  ),
                  ElevatedButton(
                      child: Text("Set Alarm"),
                      style: ElevatedButton.styleFrom(primary: flag3 ? Colors.green : Colors.purple),
                      onPressed: () {
                        _setNotification2();
                        setState(() {
                          flag3 = true;
                          flag4 = false;
                        });
                      }
                  ),
                  ElevatedButton(
                    child: Text("Delete Alarm"),
                    style: ElevatedButton.styleFrom(primary: flag4 ? Colors.red : Colors.purple),
                    onPressed: () {
                      fltrNotifications2.cancel(2);
                      setState(() {
                        flag3 = false;
                        flag4 = true;
                      });
                    },
                  )
                ],
              ),
            ),







            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi/10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: ekranYuksekligi/20,
                    width: ekranGenisligi/10,
                    child: ElevatedButton(
                      child: Text("+"),
                      onPressed: (){
                        setState(() {
                          v3 = false;
                        });
                      },
                    ),
                  ),
                  Offstage(
                    offstage: v3,
                    child: Padding(
                      padding: EdgeInsets.only(top: ekranYuksekligi/10),
                      child: Offstage(
                          offstage: visibility3,
                          child: Text("Year = " + now.year.toString() + "/" + "Month = " + now.month.toString() + "/" + "Day = " + now.day.toString() + "/" + "Time = " + time.hour.toString() + " : " + time.minute.toString(), style: TextStyle(fontSize: 10),)),
                    ),
                  ),
                  Offstage(
                    offstage: v3,
                    child: SizedBox(
                      height: ekranYuksekligi/20,
                      width: ekranGenisligi/10,
                      child: ElevatedButton(
                        child: Text("-"),
                        onPressed: (){
                          setState(() {
                            v3 = true;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Offstage(
              offstage: v3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Select Time"),
                    onPressed: () {
                      selectTime3(context);
                    },
                  ),
                  ElevatedButton(
                      child: Text("Set Alarm"),
                      style: ElevatedButton.styleFrom(primary: flag5 ? Colors.green : Colors.purple),
                      onPressed: () {
                        _setNotification3();
                        setState(() {
                          flag5 = true;
                          flag6 = false;
                        });
                      }
                  ),
                  ElevatedButton(
                    child: Text("Delete Alarm"),
                    style: ElevatedButton.styleFrom(primary: flag6 ? Colors.red : Colors.purple),
                    onPressed: () {
                      fltrNotifications3.cancel(3);
                      setState(() {
                        flag5 = false;
                        flag6 = true;
                      });
                    },
                  )
                ],
              ),
            ),


          ],
        )
    );
  }
}