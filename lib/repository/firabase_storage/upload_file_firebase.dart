import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final storageRef = FirebaseStorage.instance.ref('/images');

class UploadFileFirebase {
  uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      log(result.files.single.path!.toString());
      try {
        String name = result.files.single.name;
        final fileRef = storageRef.child('${const Uuid().v4()}.${name.split('.')[-1]}');
        await fileRef.putFile(file);
        log(fileRef.fullPath, name: 'uploadFile');
        return fileRef.fullPath;
      } catch (e) {
        log(e.toString(), name: 'uploadFile');
      }
    } else {
      return null;
    }
  }
}
