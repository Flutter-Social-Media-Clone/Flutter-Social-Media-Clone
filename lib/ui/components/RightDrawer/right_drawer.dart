import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';
import 'right_drawer_viewmodel.dart';

class ProfileDrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String toUrl;
  ProfileDrawerItem({this.icon, this.text, this.toUrl});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped ${this.text}");
        Navigator.pushNamed(context, "${this.toUrl}");
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
  DrawerItemModel(
      icon: Icons.camera_alt, text: "Change profile photo", toURL: ""),
  DrawerItemModel(
      icon: Icons.visibility_off, text: "Profile visibility", toURL: ""),
  DrawerItemModel(
      icon: Icons.verified_user, text: "Change password", toURL: ""),
  DrawerItemModel(icon: Icons.pause, text: "Deactivate account", toURL: ""),
  DrawerItemModel(icon: Icons.delete_sweep, text: "Delete account", toURL: ""),
  DrawerItemModel(icon: Icons.exit_to_app, text: "Logout", toURL: ""),
  DrawerItemModel(
      icon: Icons.edit, text: "Edit profile", toURL: "/editProfile"),
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
                .map(
                  (elementsSingle) => ProfileDrawerItem(
                    icon: elementsSingle.icon,
                    text: elementsSingle.text,
                    toUrl: elementsSingle.toURL,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
