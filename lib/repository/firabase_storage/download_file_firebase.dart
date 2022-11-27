import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

final storageRef = FirebaseStorage.instance.ref('/images');

class DownloadFileFirebase {
  Future<String?> downlandFile({pathFile}) async {
    try {
      final imageUrl = await storageRef.child("users/me/profile.png").getDownloadURL();
      log(imageUrl, name: 'downlandFile');
      return imageUrl;
    } catch(e){
      log(e.toString(), name: 'downlandFile');
    }
    return null;
  }
}
