import 'package:flutter/material.dart';
import 'package:clock_app/pages/add_alarm_page.dart';
class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Press the button below!')),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAlarms()),
          );
        },
        
        backgroundColor: Colors.blueGrey,
        label: const Text("Add Alarm", style: TextStyle(color: Colors.white),),
        icon:const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}