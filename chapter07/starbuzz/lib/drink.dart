class Drink {
  final String _name;

  final String _description;

  //drinks is an array of Drinks
  static final drinks = [
    Drink._("Latte", "A couple of espresso shots with steamed milk"),
    Drink._("Cappuccino", "Espresso, hot milk, and a steamed milk foam"),
    Drink._("Filter", "Highest quality beans roasted and brewed fresh")
  ];

  //Each Drink has a name, description, and an image resource
  Drink._(this._name, this._description);

  get description => _description;

  @override
  String toString() {
    return _name;
  }
}
