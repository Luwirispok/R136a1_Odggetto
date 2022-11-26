import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class SignWithFirebaseAuth {
  signInWithEmail(String email, String password) async {
    // try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    // } catch (e) {
    //  
    //   log('You cant registrated because this email has been already: $e');
    // }
  }
}
