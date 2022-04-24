import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  String _timeString = "";
  late var timer;

  @override
  void initState() {
    super.initState();
    if(mounted) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    } 
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());
    // DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now());
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _timeString,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      ),
      width: 300,
      height: 300,
      margin: const EdgeInsets.all(100.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.yellow,
          width: 1,
        ),
      ),
    );
  }
}
