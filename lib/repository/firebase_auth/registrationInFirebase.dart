import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class RegistrationFirebaseAuth {
  Future<String?>? registration(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user?.uid;
    } catch (e) {
      log('Ошибка при создании пользователя: $e');
    }
    return null;
  }
}
