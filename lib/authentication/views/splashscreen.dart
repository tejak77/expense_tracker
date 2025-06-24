import 'package:animate_do/animate_do.dart';
import 'package:expense_tracker/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splashscreen extends StatelessWidget {
  final bool isloggedin;
  const Splashscreen({
    super.key,
    required this.isloggedin,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(isloggedin ? '/home' : '/');
    });
    return Scaffold(
      backgroundColor: Appcolors.darkcolor,
      body: Center(
        child: FadeIn(
          duration: const Duration(seconds: 2),
          child: Image.asset(
            "assets/images/Screenshot (74).png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
