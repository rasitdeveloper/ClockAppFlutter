import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  final _scrollController = ScrollController();
  final StopWatchTimer _stopWatchTimer2 = StopWatchTimer();
  final _isHours2 = true;
  final _scrollController2 = ScrollController();
  bool visibility = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopWatchTimer.dispose();
    _scrollController.dispose();
    _stopWatchTimer2.dispose();
    _scrollController2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshot) {
                final value = snapshot.data;
                final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                return Text(displayTime, style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),);
              },),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Start"),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  },
                ),
                ElevatedButton(
                  child: Text("Stop"),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  },
                ),
                ElevatedButton(
                  child: Text("Lap"),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
                  },
                ),
                ElevatedButton(
                  child: Text("Reset"),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                  },
                ),
              ],
            ),
            Container(
              height: 120,
              margin: const EdgeInsets.all(8),
              child: StreamBuilder<List<StopWatchRecord>>(
                stream: _stopWatchTimer.records,
                initialData: _stopWatchTimer.records.value,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  if(value!.isEmpty) {
                    return Container();
                  }
                  Future.delayed(const Duration(milliseconds: 100), () {
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                  });
                  return ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final data = value[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${index + 1} - ${data.displayTime}", style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(height: 1.0,),
                        ],
                      );
                    },
                    itemCount: value.length,);
                },
              ),
            ),
            // ---------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: ekranYuksekligi/20,
                  width: ekranGenisligi/10,
                  child: ElevatedButton(
                    child: Text("+"),
                    onPressed: () {
                      setState(() {
                        visibility = false;
                      });
                    },
                  ),
                ),
                Offstage(
                  offstage: visibility,
                  child: StreamBuilder<int>(
                    stream: _stopWatchTimer2.rawTime,
                    initialData: _stopWatchTimer2.rawTime.value,
                    builder: (context, snapshot) {
                      final value2 = snapshot.data;
                      final displayTime2 = StopWatchTimer.getDisplayTime(value2!, hours: _isHours2);
                      return Text(displayTime2, style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),);
                    },),
                ),
                Offstage(
                  offstage: visibility,
                  child: SizedBox(
                    height: ekranYuksekligi/20,
                    width: ekranGenisligi/10,
                    child: ElevatedButton(
                      child: Text("-"),
                      onPressed: () {
                        setState(() {
                          visibility = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Offstage(
              offstage: visibility,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Start"),
                    onPressed: () {
                      _stopWatchTimer2.onExecute.add(StopWatchExecute.start);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Stop"),
                    onPressed: () {
                      _stopWatchTimer2.onExecute.add(StopWatchExecute.stop);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Lap"),
                    onPressed: () {
                      _stopWatchTimer2.onExecute.add(StopWatchExecute.lap);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Reset"),
                    onPressed: () {
                      _stopWatchTimer2.onExecute.add(StopWatchExecute.reset);
                    },
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: visibility,
              child: Container(
                height: 120,
                margin: const EdgeInsets.all(8),
                child: StreamBuilder<List<StopWatchRecord>>(
                  stream: _stopWatchTimer2.records,
                  initialData: _stopWatchTimer2.records.value,
                  builder: (context, snapshot) {
                    final value2 = snapshot.data;
                    if(value2!.isEmpty) {
                      return Container();
                    }
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _scrollController2.animateTo(
                          _scrollController2.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut);
                    });
                    return ListView.builder(
                      controller: _scrollController2,
                      itemBuilder: (context, index) {
                        final data2 = value2[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${index + 1} - ${data2.displayTime}", style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(height: 1.0,),
                          ],
                        );
                      },
                      itemCount: value2.length,);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
