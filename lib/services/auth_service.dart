import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<UserCredential?> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      return userCredential;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
