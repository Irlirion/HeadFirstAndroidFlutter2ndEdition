import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late Future<int> _seconds;
  late Future<bool> _isRunning;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Timer _timer;
  int? _old;

  @override
  void initState() {
    super.initState();
    _seconds = _prefs
        .then((SharedPreferences prefs) => (prefs.getInt('seconds') ?? 0));
    _isRunning = _prefs.then(
        (SharedPreferences prefs) => (prefs.getBool('isRunning') ?? false));
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      final bool isRunning = await _isRunning;
      int seconds = await _seconds;
      final SharedPreferences prefs = await _prefs;
      if (isRunning) {
        seconds += 1;

        setState(() {
          _seconds =
              prefs.setInt('seconds', seconds).then((bool success) => seconds);
        });
      }
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
              FutureBuilder<int>(
                  future: _seconds,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text(formatTime(_old),
                            style: const TextStyle(
                              fontSize: 90.0,
                            ));
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          _old = snapshot.data;
                          return Text(
                            formatTime(snapshot.data),
                            style: const TextStyle(
                              fontSize: 90.0,
                            ),
                          );
                        }
                    }
                  }),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: start, child: const Text("Start")),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: stop, child: const Text("Stop")),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: reset, child: const Text("Reset")),
            ],
          ),
        )
    );
  }

  void start() async {
    bool isRunning = await _isRunning;
    if (!isRunning) {
      final SharedPreferences prefs = await _prefs;
      isRunning = true;
      setState(() {
        _isRunning = prefs
            .setBool('isRunning', isRunning)
            .then((bool success) => isRunning);
      });
    }
  }

  void stop() async {
    bool isRunning = await _isRunning;
    if (isRunning) {
      final SharedPreferences prefs = await _prefs;
      isRunning = false;
      setState(() {
        _isRunning = prefs
            .setBool('isRunning', isRunning)
            .then((bool success) => isRunning);
      });
    }
  }

  void reset() async {
    int seconds = await _seconds;
    final SharedPreferences prefs = await _prefs;
    seconds = 0;
    setState(() {
      _seconds =
          prefs.setInt('seconds', seconds).then((bool success) => seconds);
    });
  }

  String formatTime(int? secs) {
    secs ??= 0;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }
}
