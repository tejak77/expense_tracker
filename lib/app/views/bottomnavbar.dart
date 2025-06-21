import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/app/views/homescreen.dart';
import 'package:expense_tracker/app/views/profile.dart';
import 'package:expense_tracker/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int __selectedIndex = 0;
  final List<Widget> _screens = [
    const Homescreen(),
    const Profile(),
  ];
  void _onitemtapped(int index) {
    setState(() {
      __selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, Provider, _) {
      return Scaffold(
        body: _screens[__selectedIndex],
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,
          child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 33,
              ),
              onPressed: () {
                context.go('/home/add');
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Provider.isdarkmode
              ? const Color.fromARGB(255, 7, 0, 26)
              : Appcolors.white,
          onTap: _onitemtapped,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_filled,
                color: Provider.isdarkmode
                    ? Appcolors.lightcolor
                    : Appcolors.black,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person,
                color: Provider.isdarkmode
                    ? Appcolors.lightcolor
                    : Appcolors.black,
                size: 30,
              ),
            ),
          ],
        ),
      );
    });
  }
}
