import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:oggetto_r136a1/repository/entities/check_item.dart';

class CheckListRepository {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/UserCheckList');

  Future<void> setCheckListDataProfile(String token, CheckItem check) async {
    await ref.child('/$token').set(check.toJson());
  }

  Future<void> updateCheckListDataProfile(String token, CheckItem check) async {
    await ref.child('/$token').update(check.toJson());
  }

  Future<List<CheckItem>?> getUserCheckList(String token) async {
    try {
      DataSnapshot data = await ref.child(token).get();
      var data0 = data.children;
      List<Map<String, dynamic>> data1 =
      data0.map((e) => jsonDecode(jsonEncode(e.value)) as Map<String, dynamic>).toList();
      List<CheckItem> result = data1.map((e) => CheckItem.fromJson(e)).toList();
      log(result.toString());
      return result;
    } catch(e){
      log(e.toString(), name: "getUserCheckList");
    }
    return null;
  }

  Future<List<CheckItem>?> getStandardCheckList() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref('/StandardCheckList');
    try {
      DataSnapshot data = await ref1.get();
      var data0 = data.children;
      List<Map<String, dynamic>> data1 =
      data0.map((e) => jsonDecode(jsonEncode(e.value)) as Map<String, dynamic>).toList();
      List<CheckItem> result = data1.map((e) => CheckItem.fromJson(e)).toList();
      log(result.toString());
      return result;
    } catch(e){
      log(e.toString(), name: "getStandardCheckList");
    }
    return null;
  }
}