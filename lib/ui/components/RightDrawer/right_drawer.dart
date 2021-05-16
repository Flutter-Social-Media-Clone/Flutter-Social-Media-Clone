import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        if (this.toUrl == "/welcome") {
          Get.offAllNamed("/welcome");
        } else {
          Navigator.pushNamed(context, "${this.toUrl}");
        }
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

class DrawerItemModel {
  IconData icon;
  String text;
  String toURL;

  DrawerItemModel({this.icon, this.text, this.toURL});
}

List<DrawerItemModel> elementsList = [
  DrawerItemModel(
      icon: Icons.camera_alt, text: "Change profile photo", toURL: ""),
  DrawerItemModel(
      icon: Icons.visibility_off, text: "Profile visibility", toURL: ""),
  DrawerItemModel(
      icon: Icons.verified_user, text: "Change password", toURL: ""),
  DrawerItemModel(
      icon: Icons.pause,
      text: "Deactivate account",
      toURL: "/deactivateAccount"),
  DrawerItemModel(
      icon: Icons.delete_sweep,
      text: "Delete account",
      toURL: "/deleteAccount"),
  DrawerItemModel(icon: Icons.exit_to_app, text: "Logout", toURL: "/welcome"),
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
