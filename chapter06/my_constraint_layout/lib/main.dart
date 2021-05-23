import 'package:flutter/cupertino.dart';
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
      title: 'My Constraint Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyConstraintLayout(),
    );
  }
}

class MyConstraintLayout extends StatelessWidget {
  const MyConstraintLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Constraint Layout')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('To: '),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                      hintText: 'Enter email adress',
                    )),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                  decoration: InputDecoration(
                hintText: 'Subject',
              )),
              const SizedBox(
                height: 16,
              ),
              const Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message',
                      ),
                      maxLines: null,
                      expands: true)),
              const SizedBox(
                height: 16,
              ),
              const ElevatedButton(onPressed: null, child: Text('Send'))
            ],
          ),
        ),
      ),
    );
  }
}
