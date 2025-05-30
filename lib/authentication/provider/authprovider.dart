import 'package:expense_tracker/app/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authprovider extends ChangeNotifier {
  TextEditingController phoneno = TextEditingController();
  TextEditingController password = TextEditingController();

  login(String phonenumber, String password, context) async {
    if (phonenumber == "4321" && password == "1234") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('phoneno', phonenumber.toString());

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homescreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter correct details"),
      ));
    }
  }

  String? Profilenumber;
  getSavedPhoneno() async {
    final prefs = await SharedPreferences.getInstance();
    Profilenumber = prefs.getString('phoneno');
  }
}
