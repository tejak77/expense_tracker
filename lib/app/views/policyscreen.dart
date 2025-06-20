import 'package:flutter/material.dart';

class Policyscreen extends StatelessWidget {
  const Policyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                """We value your privacy. This Privacy Policy explains how we collect, use, and protect your personal information when you use our app."""),
            SizedBox(
              height: 8,
            ),
            headingwidget(
              text: "1. Information We Collect",
            ),
            headingwidget(color: Colors.yellow, text: "text"),
            pointswidget(
              text:
                  "Personal Information: Name, email address, and contact details (only if provided by the user).",
            ),
            pointswidget(
                text:
                    "Usage Data: App interactions, device type, and IP address.")
          ],
        ),
      ),
    );
  }
}

class pointswidget extends StatelessWidget {
  final String text;
  const pointswidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
          ),
        ),
      ],
    );
  }
}

class headingwidget extends StatelessWidget {
  final String text;
  final Color color;
  const headingwidget({
    super.key,
    this.color = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
