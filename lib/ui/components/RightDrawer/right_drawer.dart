import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';
import 'right_drawer_viewmodel.dart';

class ProfileDrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  ProfileDrawerItem({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped ${this.text}");
      },
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 250,
            child: Row(
              children: [
                Icon(this.icon),
                SizedBox(width: 16),
                Text("${this.text}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<DrawerItemModel> elementsList = [
  DrawerItemModel(icon: Icons.camera_alt, text: "Change profile photo"),
  DrawerItemModel(icon: Icons.visibility_off, text: "Profile visibility"),
  DrawerItemModel(icon: Icons.verified_user, text: "Change password"),
  DrawerItemModel(icon: Icons.pause, text: "Deactivate account"),
  DrawerItemModel(icon: Icons.delete_sweep, text: "Delete account"),
  DrawerItemModel(icon: Icons.exit_to_app, text: "Logout"),
  DrawerItemModel(icon: Icons.edit, text: "Edit profile"),
];

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(15, 65, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: elementsList
                .map((elementsSingle) => ProfileDrawerItem(
                    icon: elementsSingle.icon, text: elementsSingle.text))
                .toList(),
          ),
        ),
      ),
    );
  }
}
