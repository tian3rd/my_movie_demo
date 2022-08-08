import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'controllers/bottom_nav_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // global bottom nav controller for different screens
  final bottomNavController = BottomNavController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // combine with nav bar color to make it transparent
      body: bottomNavController.page,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0, // remove shadow
        currentIndex: bottomNavController.pageIndex,
        onTap: (int index) {
          if (kDebugMode) {
            print('onTap: ${bottomNavController.pageIndex}');
          }
          setState(() {
            bottomNavController.onChangePage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: bottomNavController.backgroundColor,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavController.backgroundColor,
            icon: Icon(Icons.note_alt_outlined),
            label: 'Program',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavController.backgroundColor,
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavController.backgroundColor,
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
