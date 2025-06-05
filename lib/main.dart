import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/authentication/provider/authprovider.dart';
import 'package:expense_tracker/constant/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Authprovider()),
      ChangeNotifierProvider(create: (_) => Homeprovider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
