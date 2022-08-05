import 'package:flutter/material.dart';

import 'screens/screens.dart';

import 'demo_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;
  static List<Widget> pages = <Widget>[
    CarouselPage(),
    ProgramPage(),
    NewsPage(),
    AccountPage(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   foregroundColor: DemoTheme.dark().appBarTheme.foregroundColor,
      //   backgroundColor: DemoTheme.dark().appBarTheme.backgroundColor,
      //   title: Text('Film Buff'),
      // ),
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: DemoTheme.dark().bottomNavigationBarTheme.selectedItemColor,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Program',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}