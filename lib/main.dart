import 'package:expense_tracker/app/views/add_transactions.dart';
import 'package:expense_tracker/app/views/homescreen.dart';
import 'package:expense_tracker/app/views/manage_balance.dart';
import 'package:expense_tracker/app/views/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}
