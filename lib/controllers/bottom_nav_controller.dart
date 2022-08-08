import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/screens.dart';
import '../demo_theme.dart';

class BottomNavController extends GetxController {
  List<Widget> pages = [
    CarouselPage(),
    ProgramPage(),
    NewsPage(),
    AccountPage(),
  ];

  int _pageIndex = 0;

  Color _backgroundColor = DemoTheme.dark()
      .bottomNavigationBarTheme
      .selectedItemColor!
      .withOpacity(0.0); // make it almost transparent

  Color get backgroundColor => _backgroundColor;

  void onChangePage(int index) {
    var originalPageIndex = _pageIndex;
    _pageIndex = index;
    print('page changed from $originalPageIndex to: ${_pageIndex}');
    print('');
    update();
  }

  int get pageIndex => _pageIndex;

  Widget get page => pages[_pageIndex];
}
