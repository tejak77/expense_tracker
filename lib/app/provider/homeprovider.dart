import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController date = TextEditingController();
  List<int> amountlist = [];
  List<String> categorylist = [];
  List<String> datelist = [];

  savetransactions(int amount, String category, String date, context) {
    amountlist.add(amount);
    categorylist.add(category);
    datelist.add(date);
    this.amount.clear();
    this.category.clear();
    this.date.clear();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Data added")));
    notifyListeners();
  }
}
