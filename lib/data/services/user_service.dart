
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserService {
  Future<void> addUser(
    User user,
    String? username,
    String? phone,
  ) async {
    log('User: ${user.toString()}');
    log('username: $username');
    log('phone: $phone');
    final deviceToken = await FirebaseMessaging.instance.getToken();
    log('DEVICE TOKEN: $deviceToken');
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'userId': user.uid,
        'email': user.email,
        'fullname': user.displayName,
        'phone': phone,
        'photo': user.photoURL,
        'deviceToken': deviceToken,
      },
      SetOptions(merge: true),
    );
  }
}