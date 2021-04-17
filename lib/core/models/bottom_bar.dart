import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';

class BottomBar extends ViewModelWidget<MainAppViewModel> {
  @override
  Widget build(BuildContext context, MainAppViewModel model) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          label: 'Share',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_sharp),
          label: 'Updates',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: model.selectedIndex,
      selectedFontSize: 18,
      unselectedFontSize: 14,
      backgroundColor: bottomNavBackgroundColor,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.white,
      onTap: model.onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
