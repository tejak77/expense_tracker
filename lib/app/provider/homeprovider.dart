import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeprovider extends ChangeNotifier {
  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController date = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController dob = TextEditingController();

  saveprofile(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text.toString());
    await prefs.setString('email', email.text.toString());
    await prefs.setString('mobile', mobile.text.toString());
    await prefs.setString('dob', dob.text.toString());

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Details saved")));
  }

  loadprofile() async {
    final prefs = await SharedPreferences.getInstance();
    name.text = prefs.getString('name') ?? "";
    email.text = prefs.getString('email') ?? "";
    mobile.text = prefs.getString('mobile') ?? "";
    dob.text = prefs.getString('dob') ?? "";
  }

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
        .showSnackBar(const SnackBar(content: Text("Data added")));
    notifyListeners();
  }
}
