import 'package:fclockapp1/Clock.dart';
import 'package:fclockapp1/Stopwatch.dart';
import 'package:fclockapp1/Countdown.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ClockApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var sayfaListesi = [Clock(),Stopwatch(),Countdown()];
  int secilenIndeks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter ClockApp"),
      ),
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_add),
            label: "Clock",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessible),
            label: "Stopwatch",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg_outlined),
            label: "Countdown",
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        currentIndex: secilenIndeks,
        onTap: (indeks){
          setState(() {
            secilenIndeks = indeks;
          });
        },
      ),

    );
  }
}
