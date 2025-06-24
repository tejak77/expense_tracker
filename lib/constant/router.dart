import 'package:expense_tracker/app/views/add_transactions.dart';
import 'package:expense_tracker/app/views/bottomnavbar.dart';
import 'package:expense_tracker/app/views/manage_balance.dart';
import 'package:expense_tracker/app/views/settingscreen.dart';
import 'package:expense_tracker/authentication/views/loginscreen.dart';
import 'package:expense_tracker/authentication/views/signupscreen.dart';
import 'package:expense_tracker/authentication/views/splashscreen.dart';
import 'package:expense_tracker/main.dart';
import 'package:go_router/go_router.dart';

GoRouter router(bool isloggedin) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => Splashscreen(
          isloggedin: isloggedin,
        ),
      ),
      GoRoute(
          path: '/',
          builder: (context, state) => const Loginscreen(),
          routes: [
            GoRoute(
              path: '/signup',
              builder: (context, state) => const Signupscreen(),
            ),
          ]),
      GoRoute(
          path: '/home',
          builder: (context, state) => const Bottomnavbar(),
          routes: [
            GoRoute(
              path: 'add',
              builder: (context, state) => const AddTransactions(),
            ),
            GoRoute(
              path: 'manage',
              builder: (context, state) => const ManageBalance(),
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => const Settingscreen(),
            )
          ]),
    ],
  );
}
