import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class Authprovider extends ChangeNotifier {
  TextEditingController phoneno = TextEditingController();
  TextEditingController password = TextEditingController();

  login(String phonenumber, String password, context) async {
    if (phonenumber == "4321" && password == "1234") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('phoneno', phonenumber.toString());

      navigatorKey.currentContext?.go('/home');
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter correct details"),
      ));
    }
  }

  String? profilenumber;
  getSavedPhoneno() async {
    final prefs = await SharedPreferences.getInstance();
    profilenumber = prefs.getString('phoneno');
  }
}
