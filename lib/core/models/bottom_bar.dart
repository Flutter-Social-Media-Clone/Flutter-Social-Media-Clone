import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  final BottomNavigationState bottomNavigationState =
      Get.put(BottomNavigationState());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
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
        currentIndex: bottomNavigationState.selectedIndex.value,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        backgroundColor: bottomNavBackgroundColor,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: bottomNavigationState.onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
