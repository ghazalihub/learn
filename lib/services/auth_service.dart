import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import '../data/models/user_model.dart';

class AuthService extends GetxService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Rxn<UserModel> currentUser = Rxn<UserModel>();
  bool get isLoggedIn => currentUser.value != null;

  @override
  void onInit() {
    super.onInit();
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(auth.User? firebaseUser) async {
    if (firebaseUser != null) {
       FirebaseMessaging.instance.getToken().then((token) {
          if (token != null) {
            _firestore.collection('users').doc(firebaseUser.uid).update({'fcmToken': token});
          }
       });
       _syncUserFromFirestore(firebaseUser.uid);
    }
    if (firebaseUser == null) {
      currentUser.value = null;
      _clearLocalCache();
    } else {
      final prefs = await SharedPreferences.getInstance();
      final cachedUser = prefs.getString('cached_user_data');
      if (cachedUser != null) {
        currentUser.value = UserModel.fromJson(json.decode(cachedUser));
      }
      _syncUserFromFirestore(firebaseUser.uid);
    }
  }

  Future<void> _syncUserFromFirestore(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        final user = UserModel.fromJson(doc.data()!);
        currentUser.value = user;
        _saveToLocalCache(user);
      }
    } catch (e) {}
  }

  Future<void> _saveToLocalCache(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cached_user_data', json.encode(user.toJson()));
  }

  Future<void> _clearLocalCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cached_user_data');
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String name, String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      await credential.user!.updateDisplayName(name);
      final user = UserModel(userId: credential.user!.uid, name: name, email: email, enrolledCourses: [], joinedAt: DateTime.now());
      await _firestore.collection('users').doc(credential.user!.uid).set(user.toJson());
      currentUser.value = user;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    Get.offAllNamed(AppRoutes.logInScreen);
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final auth.AuthCredential credential = auth.FacebookAuthProvider.credential(result.accessToken!.token);
      await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<void> uploadProfileImage(File file) async {
    if (!isLoggedIn) return;
    final uid = currentUser.value!.userId;
    final ref = _storage.ref().child('users/$uid/profile.jpg');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    await _firestore.collection('users').doc(uid).update({'profileImageUrl': url});
    currentUser.value!.profileImageUrl = url;
    currentUser.refresh();
    _saveToLocalCache(currentUser.value!);
  }

  Future<void> updateProfile(String name, String email) async {
    if (!isLoggedIn) return;
    final uid = currentUser.value!.userId;
    await _firestore.collection('users').doc(uid).update({'name': name, 'email': email});
    currentUser.value!.name = name;
    currentUser.value!.email = email;
    currentUser.refresh();
    _saveToLocalCache(currentUser.value!);
  }
}
