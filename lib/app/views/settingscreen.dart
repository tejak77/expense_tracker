import 'package:expense_tracker/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 38,
            )),
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Appimage.profileicon,
                  height: 30,
                ),
                const SizedBox(
                  width: 18,
                ),
                const Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 22,
                  ),
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
  }
}
