import 'dart:convert';
import 'dart:developer';
import 'package:expense_tracker/constant/apis.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class Authprovider extends ChangeNotifier {
  TextEditingController phoneno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();

  Future<void> signup(context) async {
    var url = Uri.parse(Apis.baseurl + Apis.signup);

    var response = await http.post(
      url,
      headers: {
        'content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': name.text,
        'email': email.text,
        'mobile_no': phoneno.text,
        'dob': dob.text,
        'password': password.text,
      },
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      print(res.toString());

      if (res['status'] == true) {
        navigatorKey.currentContext?.go('/');
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res['message'])));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.statusCode.toString())));
    }
  }

  login(context) async {
    var url = Uri.parse(Apis.baseurl + Apis.login);
    var response = await http.post(
      url,
      headers: {
        'content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'identifier': phoneno.text,
        'password': password.text,
      },
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      if (res['status'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', res['user']['id'].toString());
        await prefs.setString('name', res['user']['name'].toString());
        await prefs.setString('email', res['user']['email'].toString());
        await prefs.setString('mobile_no', res['user']['mobile_no'].toString());
        await prefs.setString('dob', res['user']['dob'].toString());
        await prefs.setString('photo', res['user']['photo'].toString());
        navigatorKey.currentContext?.go('/home');
        phoneno.clear();
        password.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(res['message'] ?? "Enter correct details")));
      }
    }
    log(response.statusCode.toString());
    log(response.body.toString());
  }
}
