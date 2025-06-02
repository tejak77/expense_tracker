import 'package:expense_tracker/app/views/add_transactions.dart';
import 'package:expense_tracker/app/views/homescreen.dart';
import 'package:expense_tracker/app/views/profile.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: _screens[__selectedIndex],
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 33,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTransactions()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onitemtapped,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
