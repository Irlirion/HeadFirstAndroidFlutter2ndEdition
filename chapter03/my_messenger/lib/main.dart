import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Messenger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MessengerPage(),
    );
  }
}

class MessengerPage extends StatefulWidget {
  const MessengerPage({Key? key}) : super(key: key);

  @override
  State<MessengerPage> createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Messenger"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Enter a message'
                ),
                controller: myController,
              ),
              width: 160,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: _sendMessage,
                child: const Text("Send Message"))
          ],
        ),
      )
    );
  }

  void _sendMessage() {
    if (myController.text.isNotEmpty) {
      Share.share(myController.text);
    }
  }
}
