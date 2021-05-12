import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyAuth extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(email, password) async {
    try {
      UserCredential userCredentials = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredentials.toString());
    } on FirebaseAuthException catch (e) {
      print("Error" + e.toString());
    }
  }

  Future<void> login(email, password) async {
    try {
      UserCredential userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredentials.toString());
      Get.offAllNamed("/mainapp");
    } on FirebaseAuthException catch (e) {
      print("Error" + e.toString());
    }
  }
}
