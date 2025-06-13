import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/authentication/provider/authprovider.dart';
import 'package:expense_tracker/constant/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isloggedin = pref.getBool('isloggedin') ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Authprovider()),
      ChangeNotifierProvider(create: (_) => Homeprovider()),
    ],
    child: MyApp(
      isloggedin: isloggedin,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool isloggedin;
  const MyApp({
    super.key,
    required this.isloggedin,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router(isloggedin),
    );
  }
}
