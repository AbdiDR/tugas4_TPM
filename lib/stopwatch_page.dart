import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchPage extends StatefulWidget {
  final String username;
  const StopwatchPage({Key? key, required this.username}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _MyAppState();
}

class _MyAppState extends State<StopwatchPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('StopWatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshot) {
                final value = snapshot.data;
                final displayTime =
                StopWatchTimer.getDisplayTime(value!, hours: _isHours);

                return Text(
                  displayTime,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  startButton(),
                  const SizedBox(
                    width: 10,
                  ),
                  stopButton(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            resetButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton startButton() {
    return ElevatedButton(
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      },
      child: const Text('Start'),
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          textStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  ElevatedButton stopButton() {
    return ElevatedButton(
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
      },
      child: const Text('Stop'),
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          textStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  ElevatedButton resetButton() {
    return ElevatedButton(
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
      },
      child: const Text('Reset'),
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          textStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
  
}