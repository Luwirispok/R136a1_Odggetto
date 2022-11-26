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

  Future<void> updateUserDataProfile(String token, User user) async {
    await ref.child('/$token').update(user.toJson());
  }

  Future<List<Employee>?> getAllUsers() async {
    try{
      List<Employee> result = await ref.get().then((value) => value.children
          .map(
            (el) => Employee(
              id: el.key,
              user: User.fromJson(
                (el.value as Map<String, dynamic>),
              ),
            ),
          )
          .toList());
      log(result.toString());
      return result;
    } catch(e){
      log(e.toString(), name: "getAllUsers");
    }
    return null;
  }

  Future<User?> getUser(String token) async {
    try{
      User result =
          await ref.child("/$token").get().then((value) => User.fromJson(value.value as Map<String, dynamic>));
      log(result.toString());
      return result;
    } catch(e){
      log(e.toString(), name: "getUser");
    }
    return null;
  }
}
