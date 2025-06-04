import 'dart:developer';

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
  String? profile_image;

  saveprofile(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text.toString());
    await prefs.setString('email', email.text.toString());
    await prefs.setString('mobile', mobile.text.toString());
    await prefs.setString('dob', dob.text.toString());
    await prefs.setString('image', profile_image ?? "");

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Details saved")));
  }

  loadprofile() async {
    final prefs = await SharedPreferences.getInstance();
    name.text = prefs.getString('name') ?? "";
    email.text = prefs.getString('email') ?? "";
    mobile.text = prefs.getString('mobile') ?? "";
    dob.text = prefs.getString('dob') ?? "";
    profile_image = prefs.getString('image');
    notifyListeners();
  }

  List<int> amountlist = [];
  List<String> categorylist = [];
  List<String> datelist = [];
  int totalexpenses = 0;

  savetransactions(int amount, String category, String date, context) async {
    amountlist.add(amount);
    categorylist.add(category);
    datelist.add(date);
    this.amount.clear();
    this.category.clear();
    this.date.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('categorylist', categorylist);
    await prefs.setStringList('datelist', datelist);
    List<String> stringlist = amountlist.map((e) => e.toString()).toList();
    await prefs.setStringList('amountlist', stringlist);
    if (amountlist.length >= 1) {
      totalexpenses = amountlist.reduce((a, b) => a + b);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Data added")));
    notifyListeners();
  }

  loadtransactions() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    categorylist = pref.getStringList('categorylist') ?? [];
    datelist = pref.getStringList('datelist') ?? [];
    List<String>? stringlist = pref.getStringList('amountlist') ?? [];
    amountlist = stringlist.map(int.parse).toList();
    if (amountlist.length >= 1) {
      totalexpenses = amountlist.reduce((a, b) => a + b);
    }
    print(amountlist.toString());
    print(categorylist.toString());
    print(datelist.toString());
  }

  // manage balance
  TextEditingController income1 = TextEditingController();
  TextEditingController income2 = TextEditingController();

  saveincome1() async {
    final prefs = await SharedPreferences.getInstance();

    int temp = int.parse(prefs.getString('income1') ?? "0");
    log(temp.toString());
    int temp2 = temp + int.parse(income1.text);
    log(temp2.toString());

    await prefs.setString('income1', temp2.toString());
    this.income1.clear();
    getincome();
    notifyListeners();
  }

  saveincom2() async {
    final prefs = await SharedPreferences.getInstance();
    int temp = int.parse(prefs.getString('income2') ?? "0");
    int temp2 = temp + int.parse(income2.text);
    await prefs.setString('income2', temp2.toString());
    this.income2.clear();
    getincome();
    notifyListeners();
  }

  int income = 0;

  getincome() async {
    final prefs = await SharedPreferences.getInstance();
    income = int.parse(prefs.getString('income1') ?? "0") +
        int.parse(prefs.getString('income2') ?? "0");
    notifyListeners();
  }
}
