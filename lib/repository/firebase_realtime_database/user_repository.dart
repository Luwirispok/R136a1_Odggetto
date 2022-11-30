import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:oggetto_r136a1/repository/entities/employee.dart';
import 'package:oggetto_r136a1/repository/entities/user.dart';
import 'package:oggetto_r136a1/repository/entities/user_sign_up.dart';

class UserRepository {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Users');

  Future<void> setUserDataProfile(String token, UserSignUp user) async {
    await ref.child('/$token').set(user.toJson());
  }

  Future<void> updateUserDataProfile(String token, UserOd user) async {
    await ref.child('/$token').update(user.toJson());
  }

  Future<List<UserOd>?> getAllUsers() async {
    try {
      DataSnapshot data = await ref.get();
      var data0 = data.children;
      List<Map<String, dynamic>> data1 =
          data0.map((e) => jsonDecode(jsonEncode(e.value)) as Map<String, dynamic>).toList();
      List<UserOd> result = data1.map((e) => UserOd.fromJson(e)).toList();
      log(result.toString());
      return result;
    } catch(e){
      log(e.toString(), name: "getAllUsers");
    }
    return null;
  }

  Future<UserOd?> getUser(String token) async {
    try {
      DataSnapshot dataSnapshot = await ref.child(token).get();
      log(dataSnapshot.toString());
      var data = dataSnapshot.value;
      String data1 = jsonEncode(data);
      Map<String, dynamic> data2 = jsonDecode(data1);
      log(data2['name']);
      UserOd result = UserOd.fromJson(data2);
      log(result.toString());
      return result;
    } catch(e){
      log(e.toString(), name: "getUser");
    }
    return null;
  }
}
