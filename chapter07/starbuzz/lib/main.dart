import 'package:flutter/material.dart';
import 'package:starbuzz/drink.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Starbuzz"),
        ),
        body: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
              title: const Text("Drinks"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrinkCategoryPage()),
                );
              }),
          const ListTile(
            title: Text("Food"),
          ),
          const ListTile(
            title: Text("Stores"),
          ),
        ]).toList()));
  }
}

class DrinkCategoryPage extends StatelessWidget {
  final drinks = Drink.drinks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starbuzz"),
      ),
      body: ListView.separated(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final item = drinks[index];

          return ListTile(
            title: Text(item.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DrinkInfoPage(name: item.toString(),
                  description: item.description,)),
              );
            }
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}

class DrinkInfoPage extends StatelessWidget {
  const DrinkInfoPage(
      {Key? key, required this.name, required this.description})
      : super(key: key);
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starbuzz"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(description)
        ],
      ),
    );
  }
}
