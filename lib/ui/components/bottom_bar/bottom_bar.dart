import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainAppViewModel>.reactive(
      viewModelBuilder: () => MainAppViewModel(),
      builder: (context, model, child) => BottomNavigationBar(
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
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: model.getSelectedIndex(),
        selectedFontSize: 18,
        unselectedFontSize: 14,
        backgroundColor: bottomNavBackgroundColor,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: model.onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
