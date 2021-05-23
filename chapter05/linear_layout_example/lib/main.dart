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
      title: 'Layout Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LayoutExamples(),
    );
  }
}

class LayoutExamples extends StatefulWidget {
  const LayoutExamples({Key? key}) : super(key: key);

  @override
  State<LayoutExamples> createState() => _LayoutExamplesState();
}

class _LayoutExamplesState extends State<LayoutExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Layout Examples"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              TextField(
                decoration: InputDecoration(
                  labelText: 'To',
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                    ),
                    maxLines: null,
                    expands: true),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: null, child: Text("Send"))
            ],
          ),
        ));
  }
}
