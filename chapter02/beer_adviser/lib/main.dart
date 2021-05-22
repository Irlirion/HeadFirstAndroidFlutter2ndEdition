import 'package:flutter/material.dart';

class BeerExpert {
  List<String> getBrands(String color) {
    List<String> brands = [];
    if (color == "amber") {
      brands.add("Jack Amber");
      brands.add("Red Moose");
    } else {
      brands.add("Jail Pale Ale");
      brands.add("Gout Stout");
    }
    return brands;
  }
}

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
        home: const BeerAdviser());
  }
}

class BeerAdviser extends StatefulWidget {
  const BeerAdviser({Key? key}) : super(key: key);

  @override
  _BeerAdviserState createState() => _BeerAdviserState();
}

class _BeerAdviserState extends State<BeerAdviser> {
  final _beers = <String>['light', 'amber', 'brown', 'dark']
      .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  final _expert = BeerExpert();

  var _brands = 'No beers selected';
  var _beerType = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beer Adviser'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: _beerType,
              items: _beers,
              onChanged: (String? newValue) {
                setState(() {
                  _beerType = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _findBeer,
              child: const Text("Find Beer!"),
            ),
            const SizedBox(height: 16),
            Text(_brands)
          ],
        ),
      ),
    );
  }

  void _findBeer() {
    var brandsList = _expert.getBrands(_beerType);
    var brandsFormatted = StringBuffer();
    for (var brand in brandsList) {
      brandsFormatted.writeln(brand);
    }
    setState(() {
      _brands = brandsFormatted.toString();
    });
  }
}
