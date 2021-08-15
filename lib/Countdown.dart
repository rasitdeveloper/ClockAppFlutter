import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({Key? key}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer zamanlayici1;
  int kalanSure1 = 0 ;
  var hour1 = TextEditingController();
  var minute1 = TextEditingController();
  var second1 = TextEditingController();
  bool isRunning1 = false;
  bool isPausing1 = false;
  var tf1 = TextEditingController();

  late Timer zamanlayici2;
  int kalanSure2 = 0 ;
  var hour2 = TextEditingController();
  var minute2 = TextEditingController();
  var second2 = TextEditingController();
  bool isRunning2 = false;
  bool isPausing2 = false;
  bool visibility2 = true;
  var tf2 = TextEditingController();

  late Timer zamanlayici3;
  int kalanSure3 = 0 ;
  var hour3 = TextEditingController();
  var minute3 = TextEditingController();
  var second3 = TextEditingController();
  bool isRunning3 = false;
  bool isPausing3 = false;
  bool visibility3 = true;
  var tf3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: ekranYuksekligi/50),
                  child: SizedBox(
                    height: ekranYuksekligi / 25,
                    width: ekranGenisligi /2,
                    child: TextField(
                      controller: tf1,
                      decoration: InputDecoration(
                        hintText: "You can enter the countdown timer name",
                        hintStyle: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: ekranYuksekligi / 25,
                      width: ekranGenisligi /10,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: hour1,
                        decoration: InputDecoration(
                          hintText: "Hour",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ekranYuksekligi / 25,
                      width: ekranGenisligi /10,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: minute1,
                        decoration: InputDecoration(
                          hintText: "Min",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ekranYuksekligi / 25,
                      width: ekranGenisligi /10,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: second1,
                        decoration: InputDecoration(
                          hintText: "Sec",
                        ),
                      ),
                    ),
                  ],),
                // Text("Remainging Time : $kalanSure sn",style: TextStyle(fontSize: 30),),
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: ekranYuksekligi/20,
                        width: ekranGenisligi/4,
                        child: ElevatedButton(
                          child: Text("START"),
                          onPressed: (){
                            if(hour1.text.isEmpty)
                              hour1.text = "0";
                            if(minute1.text.isEmpty)
                              minute1.text = "0";
                            if(second1.text.isEmpty)
                              second1.text = "0";
                            if(isRunning1 == false) {
                              kalanSure1 = int.parse(hour1.text) * 3600 + int.parse(minute1.text) * 60 + int.parse(second1.text) * 1;
                              zamanlayici1 = Timer.periodic(Duration(seconds: 1), (timer) {
                                setState(() {
                                  if(kalanSure1 == 0){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Countdown timer is over!"),
                                    ));
                                    kalanSure1  = 0;
                                    zamanlayici1.cancel();
                                    isRunning1 = false;
                                  }else{
                                    kalanSure1 = kalanSure1 - 1 ;
                                    hour1.text = (kalanSure1 / 3600).toInt().toString();
                                    minute1.text = ((kalanSure1 % 3600) / 60).toInt().toString();
                                    second1.text = ((kalanSure1 % 60) / 1).toInt().toString();
                                  }
                                });
                              });
                              isRunning1 = true;
                              isPausing1 = false;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Already Running"),
                              ));
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: ekranYuksekligi/20,
                        width: ekranGenisligi/4,
                        child: ElevatedButton(
                          child: Text("PAUSE"),
                          onPressed: (){
                            if(isRunning1 == false) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Already Pausing"),
                              ));
                            } else {
                              zamanlayici1.cancel();
                              isRunning1 = false;
                              isPausing1 = true;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: ekranYuksekligi/20,
                        width: ekranGenisligi/4,
                        child: ElevatedButton(
                          child: Text("STOP"),
                          onPressed: (){
                            zamanlayici1.cancel();
                            hour1.text = "0";
                            minute1.text = "0";
                            second1.text = "0";
                            kalanSure1 = 0;
                            isRunning1 = false;
                            isPausing1 = true;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/25),
                  child: Offstage(
                    offstage: visibility2,
                    child: SizedBox(
                      height: ekranYuksekligi / 25,
                      width: ekranGenisligi /2,
                      child: TextField(
                        controller: tf2,
                        decoration: InputDecoration(
                          hintText: "You can enter the countdown timer name",
                          hintStyle: TextStyle(fontSize: 10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/25),
                  child: Row( // --------------------------------------------------------------------
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: ekranYuksekligi/20,
                        width: ekranGenisligi/10,
                        child: ElevatedButton(
                          child: Text("+"),
                          onPressed: (){
                            setState(() {
                              visibility2 = false;
                            });
                          },
                        ),
                      ),
                      Offstage(
                        offstage: visibility2,
                        child: SizedBox(
                          height: ekranYuksekligi / 25,
                          width: ekranGenisligi /10,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: hour2,
                            decoration: InputDecoration(
                              hintText: "Hour",
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: visibility2,
                        child: SizedBox(
                          height: ekranYuksekligi / 25,
                          width: ekranGenisligi /10,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: minute2,
                            decoration: InputDecoration(
                              hintText: "Min",
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: visibility2,
                        child: SizedBox(
                          height: ekranYuksekligi / 25,
                          width: ekranGenisligi /10,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: second2,
                            decoration: InputDecoration(
                              hintText: "Sec",
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: visibility2,
                        child: SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/10,
                          child: ElevatedButton(
                            child: Text("-"),
                            onPressed: (){
                              setState(() {
                                visibility2 = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ],),
                ),
                // Text("Remainging Time : $kalanSure sn",style: TextStyle(fontSize: 30),),
                Offstage(
                  offstage: visibility2,
                  child: Padding(
                    padding: EdgeInsets.only(top: ekranYuksekligi/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/4,
                          child: ElevatedButton(
                            child: Text("START"),
                            onPressed: (){
                              if(hour2.text.isEmpty)
                                hour2.text = "0";
                              if(minute2.text.isEmpty)
                                minute2.text = "0";
                              if(second2.text.isEmpty)
                                second2.text = "0";
                              if(isRunning2 == false) {
                                kalanSure2 = int.parse(hour2.text) * 3600 + int.parse(minute2.text) * 60 + int.parse(second2.text) * 1;
                                zamanlayici2 = Timer.periodic(Duration(seconds: 1), (timer) {
                                  setState(() {
                                    if(kalanSure2 == 0){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Countdown timer is over!"),
                                      ));
                                      kalanSure2  = 0;
                                      zamanlayici2.cancel();
                                      isRunning2 = false;
                                    }else{
                                      kalanSure2 = kalanSure2 - 1 ;
                                      hour2.text = (kalanSure2 / 3600).toInt().toString();
                                      minute2.text = ((kalanSure2 % 3600) / 60).toInt().toString();
                                      second2.text = ((kalanSure2 % 60) / 1).toInt().toString();
                                    }
                                  });
                                });
                                isRunning2 = true;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Already Running"),
                                ));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/4,
                          child: ElevatedButton(
                            child: Text("PAUSE"),
                            onPressed: (){
                              if(isRunning2 == false) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Already Pausing"),
                                ));
                              } else {
                                zamanlayici2.cancel();
                                isRunning2 = false;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/4,
                          child: ElevatedButton(
                            child: Text("STOP"),
                            onPressed: (){
                              /*
                          if(isRunning2 == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Already Stopping"),
                            ));
                          } else {
                            zamanlayici2.cancel();
                            hour2.text = "0";
                            minute2.text = "0";
                            second2.text = "0";
                            kalanSure2 = 0;
                            isRunning2 = false;
                          }
                          */
                              zamanlayici2.cancel();
                              hour2.text = "0";
                              minute2.text = "0";
                              second2.text = "0";
                              kalanSure2 = 0;
                              isRunning2 = false;

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/25),
                  child: Offstage(
                    offstage: visibility3,
                    child: SizedBox(
                      height: ekranYuksekligi / 25,
                      width: ekranGenisligi /2,
                      child: TextField(
                        controller: tf3,
                        decoration: InputDecoration(
                          hintText: "You can enter the countdown timer name",
                          hintStyle: TextStyle(fontSize: 10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/25),
                  child: Row( // --------------------------------------------------------------------
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: ekranYuksekligi/20,
                        width: ekranGenisligi/10,
                        child: ElevatedButton(
                          child: Text("+"),
                          onPressed: (){
                            setState(() {
                              visibility3 = false;
                            });
                          },
                        ),
                      ),
                      Offstage(
                        offstage: visibility3,
                        child: SizedBox(
                          height: ekranYuksekligi / 25,
                          width: ekranGenisligi /10,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: hour3,
                            decoration: InputDecoration(
                              hintText: "Hour",
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: visibility3,
                        child: SizedBox(
                          height: ekranYuksekligi / 25,
                          width: ekranGenisligi /10,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: minute3,
                            decoration: InputDecoration(
                              hintText: "Min",
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: visibility3,
                        child: SizedBox(
                          height: ekranYuksekligi / 25,
                          width: ekranGenisligi /10,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: second3,
                            decoration: InputDecoration(
                              hintText: "Sec",
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: visibility3,
                        child: SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/10,
                          child: ElevatedButton(
                            child: Text("-"),
                            onPressed: (){
                              setState(() {
                                visibility3 = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ],),
                ),
                // Text("Remainging Time : $kalanSure sn",style: TextStyle(fontSize: 30),),
                Offstage(
                  offstage: visibility3,
                  child: Padding(
                    padding: EdgeInsets.only(top: ekranYuksekligi/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/4,
                          child: ElevatedButton(
                            child: Text("START"),
                            onPressed: (){
                              if(hour3.text.isEmpty)
                                hour3.text = "0";
                              if(minute3.text.isEmpty)
                                minute3.text = "0";
                              if(second3.text.isEmpty)
                                second3.text = "0";
                              if(isRunning3 == false) {
                                kalanSure3 = int.parse(hour3.text) * 3600 + int.parse(minute3.text) * 60 + int.parse(second3.text) * 1;
                                zamanlayici3 = Timer.periodic(Duration(seconds: 1), (timer) {
                                  setState(() {
                                    if(kalanSure3 == 0){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Countdown timer is over!"),
                                      ));
                                      kalanSure3  = 0;
                                      zamanlayici3.cancel();
                                      isRunning3 = false;
                                    }else{
                                      kalanSure3 = kalanSure3 - 1 ;
                                      hour3.text = (kalanSure3 / 3600).toInt().toString();
                                      minute3.text = ((kalanSure3 % 3600) / 60).toInt().toString();
                                      second3.text = ((kalanSure3 % 60) / 1).toInt().toString();
                                    }
                                  });
                                });
                                isRunning3 = true;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Already Running"),
                                ));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/4,
                          child: ElevatedButton(
                            child: Text("PAUSE"),
                            onPressed: (){
                              if(isRunning3 == false) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Already Pausing"),
                                ));
                              } else {
                                zamanlayici3.cancel();
                                isRunning3 = false;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: ekranYuksekligi/20,
                          width: ekranGenisligi/4,
                          child: ElevatedButton(
                            child: Text("STOP"),
                            onPressed: (){
                              zamanlayici3.cancel();
                              hour3.text = "0";
                              minute3.text = "0";
                              second3.text = "0";
                              kalanSure3 = 0;
                              isRunning3 = false;

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
