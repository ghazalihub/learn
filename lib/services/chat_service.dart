import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> isChatUnlocked() async {
    final prefs = await SharedPreferences.getInstance();
    final unlockTime = prefs.getInt('chat_unlock_time') ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    return (now - unlockTime < 4 * 60 * 60 * 1000);
  }

  Future<void> unlockChat() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('chat_unlock_time', DateTime.now().millisecondsSinceEpoch);
  }

  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> sendMessage(String chatId, String senderId, String message) async {
    await _firestore.collection('chats').doc(chatId).collection('messages').add({
      'senderId': senderId,
      'text': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
