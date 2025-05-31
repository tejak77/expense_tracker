import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/app/views/bottomnavbar.dart';
import 'package:expense_tracker/authentication/provider/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Authprovider()),
      ChangeNotifierProvider(create: (_) => Homeprovider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottomnavbar(),
    );
  }
}
