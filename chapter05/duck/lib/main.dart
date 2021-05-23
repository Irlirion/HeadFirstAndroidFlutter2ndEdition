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
      title: 'Duck',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const DuckPage(),
    );
  }
}

class DuckPage extends StatelessWidget {
  const DuckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Duck'),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const Image(image: AssetImage('assets/images/duck.jpg')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('It`s a duck!'),
                  Text('(not a real one)'),
                ],
              ),
            )
          ],
        ));
  }
}
