import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/app/views/policyscreen.dart';
import 'package:expense_tracker/app/views/profile.dart';
import 'package:expense_tracker/constant/colors.dart';
import 'package:expense_tracker/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor:
            provider.isdarkmode ? Appcolors.darkcolor : Appcolors.white,
        appBar: AppBar(
          backgroundColor:
              provider.isdarkmode ? Appcolors.darkcolor : Appcolors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                color: provider.isdarkmode
                    ? Appcolors.lightcolor
                    : Appcolors.black,
                size: 38,
              )),
          title: Text(
            "Settings",
            style: TextStyle(
              color:
                  provider.isdarkmode ? Appcolors.lightcolor : Appcolors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              settingwidget(
                  icon: Icons.person,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  text: "My Profile"),
              const SizedBox(
                height: 20,
              ),
              settingwidget(
                icon: Icons.privacy_tip_outlined,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Policyscreen()));
                },
                text: "Privacy Policy",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    size: 30,
                    color: provider.isdarkmode
                        ? Appcolors.lightcolor
                        : Appcolors.black,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Dark Mode",
                    style: TextStyle(
                      color: provider.isdarkmode
                          ? Appcolors.lightcolor
                          : Appcolors.black,
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: provider.isdarkmode,
                    onChanged: (_) => provider.toggledarkmode(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            // backgroundColor: Colors.black,
                            title: Text('Confirm Logout ?'),
                            content: Text('Are you sure want to logout'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(ctx).pop();
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.clear();
                                  context.go('/');
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      Appimage.logouticon,
                      height: 30,
                      color: provider.isdarkmode
                          ? Appcolors.lightcolor
                          : Appcolors.black,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class settingwidget extends StatelessWidget {
  final VoidCallback ontap;
  final IconData icon;
  final String text;
  const settingwidget({
    required this.icon,
    required this.ontap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color:
                  provider.isdarkmode ? Appcolors.lightcolor : Appcolors.black,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 22,
                  color: provider.isdarkmode
                      ? Appcolors.lightcolor
                      : Appcolors.black),
            ),
          ],
        ),
      );
    });
  }
}
