import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';

class AddAlarms extends StatefulWidget {
  const AddAlarms({Key? key}) : super(key: key);

  @override
  State<AddAlarms> createState() => _AddAlarmsState();
}

class _AddAlarmsState extends State<AddAlarms> {

   DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Alarm'),
        backgroundColor: Colors.transparent,
      ),
      body: 
      Center(
        child: Column(
          children:  <Widget>[
          const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
		          borderRadius: BorderRadius.all(Radius.circular(20.0)), 
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: 'Enter a alarm name',
            
          ),
          ),
        ),
        const SizedBox(height: 100),
        buildTimePicker(),  
    
         ],
        ),
      ),
      
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 110,
            child: FloatingActionButton(
              backgroundColor:Colors.blueGrey,
              
              heroTag: 'back',
              
              onPressed: (){},
                 child: const Icon(
                   
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40,

                  
                )
              ),
          ),
          Positioned(
            bottom: 16,
            right: 110,
            child: FloatingActionButton(
              backgroundColor:Colors.blueGrey,
              
              heroTag: 'next',
              onPressed: (){},

                 child: const Icon(
                  Icons.cancel_rounded,
                  color: Colors.red,
                  
                  size: 40,
                )
              ),
          ),  
        ],
      ),
    );
  }
    Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 1,
          //use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}