import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  final _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshot) {
              final value = snapshot.data;
              final displayTime = StopWatchTimer.getDisplayTime(value!,hours: _isHours);
              return Text(
                displayTime,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                
                ),
              );
            },),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  onPressed: (){
                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  },
                  child: const Text("Start"),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  onPressed: (){
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  },
                  child: const Text("Stop"),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                  backgroundColor: Colors.black,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  onPressed: (){
                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                  },
                  child: const Text("Reset"),
                  ),  
              ],
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  onPressed: (){
                    _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
                  },
                  child: const Text("Lap"),
                  ),
                  const SizedBox(height: 10),
                 
              ],
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.all(8),
              child: StreamBuilder<List<StopWatchRecord>>(
                stream: _stopWatchTimer.records,
                initialData: _stopWatchTimer.records.value,
                builder: (context,snapshot){
                  final value = snapshot.data;
                  if(value!.isEmpty){
                    return Container();
                  }
                  Future.delayed(const Duration(milliseconds: 100),(){
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200), 
                      curve: Curves.easeInOut,
                      );
                  });
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: value.length,
                    itemBuilder: (context,index){
                      final data = value[index];
                      return Column(
                        children:  [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '${index+1} - ${data.displayTime}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                            const Divider(height: 1,),
                        ],
                      );
                    }
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
      
}  
    
