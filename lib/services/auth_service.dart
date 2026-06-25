import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import '../data/models/user_model.dart';

class AuthService extends GetxService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rxn<UserModel> currentUser = Rxn<UserModel>();
  bool get isLoggedIn => currentUser.value != null;

  @override
  void onInit() {
    super.onInit();
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(auth.User? firebaseUser) async {
    if (firebaseUser == null) {
      currentUser.value = null;
    } else {
      final doc = await _firestore.collection('users').doc(firebaseUser.uid).get();
      if (doc.exists) {
        currentUser.value = UserModel.fromJson(doc.data()!);
      } else {
        currentUser.value = UserModel(
          userId: firebaseUser.uid,
          email: firebaseUser.email,
          name: firebaseUser.displayName ?? "Student",
          enrolledCourses: [],
          joinedAt: DateTime.now(),
        );
        await _firestore.collection('users').doc(firebaseUser.uid).set(currentUser.value!.toJson());
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String name, String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      await credential.user!.updateDisplayName(name);
      final user = UserModel(
        userId: credential.user!.uid,
        name: name,
        email: email,
        enrolledCourses: [],
        joinedAt: DateTime.now(),
      );
      await _firestore.collection('users').doc(credential.user!.uid).set(user.toJson());
      currentUser.value = user;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    Get.offAllNamed(AppRoutes.logInScreen);
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
