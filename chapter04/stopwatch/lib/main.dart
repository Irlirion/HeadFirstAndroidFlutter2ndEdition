import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stopwatch"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                formatTime(_stopwatch.elapsedMilliseconds),
                style: const TextStyle(
                  fontSize: 90.0,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: start, child: const Text("Start")),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: stop, child: const Text("Stop")),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: reset, child: const Text("Reset")),
            ],
          ),
        ));
  }

  void start() {
    setState(() {
      if (!_stopwatch.isRunning) {
        _stopwatch.start();
      }
    });
  }

  void stop() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      }
    });
  }

  void reset() {
    setState(() {
      _stopwatch.reset();
    });
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }
}
