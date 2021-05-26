import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/cardModel.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:get/get.dart';

class NotificationState extends GetxController {
  var myselectedIndex = "posts".obs;
  var username = "".obs;
  var userData = {}.obs;

  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MyAuth myAuth = Get.put(MyAuth());

  Future<void> getUsername() async {
    var data = await myFirestore.getUser(myAuth.getCurrentUser());
    username.value = data["username"].toString();

    print(data);
  }

  Future<void> getUserData() async {
    userData.value = await myFirestore.getUser(myAuth.getCurrentUser());
  }

  void setmyIndex(var index) {
    myselectedIndex.value = index;
  }

  Future getMyNotification() async {
    await getUserData();
    var a = await myFirestore.getNotifications(myAuth.getCurrentUser());
    var b = List<NotificationModel>();
    print("TADAA" + a.toString());
    a.forEach((k, item) {
      print("anan" + item.toString());
      b.add(NotificationModel(
          id: 1,
          timestamp: Timestamp.now(),
          image_url: "asdsda",
          notification: item.notification));
    });
    myPosts = b;
  }

  List<NotificationModel> myPosts = new RxList<NotificationModel>();
  List<NotificationModel> getMyResults(String username) {
    print("getMyResults for " + username);
    print("POST");
    return myPosts;
  }

  // List<PostBase> getMyResults(String username) {
  //   print("getMyResults for " + username);
  //   if (myselectedIndex.value == "posts") {
  //     print("POST");
  //     return myPosts;
  //   } else if (myselectedIndex.value == "medias") {
  //     print("POST");
  //     return myMedias;
  //   } else {
  //     return myLocations;
  //   }
  // }
}
