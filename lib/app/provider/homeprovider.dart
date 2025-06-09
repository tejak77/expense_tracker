import 'dart:convert';
import 'dart:developer';

import 'package:expense_tracker/constant/apis.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Homeprovider extends ChangeNotifier {
  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController date = TextEditingController();
  String? userid;
  String? balance;

  Future<void> transactions(context) async {
    var url = Uri.parse(Apis.baseurl + Apis.addtransactions);

    var response = await http.post(
      url,
      headers: {
        'content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'user_id': userid,
        'amount': amount.text,
        'type': 'debit',
        'category': category.text,
        'transaction_date': date.text,
      },
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      print(res.toString());

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('balance', res['balance'].toString());

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res['message'])));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.statusCode.toString())));
    }
  }

  Future<void> addbalance(context) async {
    var url = Uri.parse(Apis.baseurl + Apis.addtransactions);
    int sum = int.parse(income1.text.isEmpty ? "0" : income1.text) +
        int.parse(income2.text.isEmpty ? "0" : income2.text);
    var response = await http.post(
      url,
      headers: {
        'content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'user_id': userid,
        'amount': sum.toString(),
        'type': 'credit',
        'category': 'dummy',
        'transaction_date': 'dummy',
      },
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      print(res.toString());

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('balance', res['balance'].toString());

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res['message'])));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.statusCode.toString())));
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController dob = TextEditingController();
  String? profileimage;

  saveprofile(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text.toString());
    await prefs.setString('email', email.text.toString());
    await prefs.setString('mobile_no', mobile.text.toString());
    await prefs.setString('dob', dob.text.toString());
    await prefs.setString('photo', profileimage ?? "");

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Details saved")));
  }

  loadid() async {
    final prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('id') ?? "";
  }

  loadbalance() async {
    final prefs = await SharedPreferences.getInstance();
    balance = prefs.getString('balance') ?? "0";
  }

  loadprofile() async {
    final prefs = await SharedPreferences.getInstance();
    name.text = prefs.getString('name') ?? "";
    email.text = prefs.getString('email') ?? "";
    mobile.text = prefs.getString('mobile_no') ?? "";
    dob.text = prefs.getString('dob') ?? "";
    profileimage = prefs.getString('photo');
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
    if (amountlist.isNotEmpty) {
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
    if (amountlist.isNotEmpty) {
      totalexpenses = amountlist.reduce((a, b) => a + b);
    }
    log(amountlist.toString());
    log(categorylist.toString());
    log(datelist.toString());
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
    income1.clear();
    getincome();
    notifyListeners();
  }

  saveincom2() async {
    final prefs = await SharedPreferences.getInstance();
    int temp = int.parse(prefs.getString('income2') ?? "0");
    int temp2 = temp + int.parse(income2.text);
    await prefs.setString('income2', temp2.toString());
    income2.clear();
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
