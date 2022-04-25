import 'package:flutter/material.dart';
import 'package:clock_app/pages/alarm_page.dart';
import 'package:clock_app/pages/clock_page.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 
  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 10,
          bottom: const 
            TabBar(
            
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.access_time),
                text: "Clock",
                
                
              ),
              Tab(
                text: "Alarm",
                icon: Icon(Icons.alarm),
              ),
              
              Tab(
                text: "Stopwatch",
                icon: Icon(Icons.av_timer),
              ),
              Tab(
                text: "Timer",
                icon: Icon(Icons.timer),
              ),
            ],
           ),
         
        ),
        body: const SafeArea(
         child: TabBarView(
          children: <Widget>[
            Center(
              child: ClockPage(),
            ),
             Center(
              child: AlarmPage(),
            ),
             Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
        ),
      ),
    );
  }
}


