import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/globals/config.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<String?> addUser(
      {required String name, required String phone_number}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("users");
      await users.doc(phone_number).set({
        'name': name,
      });

      return "User added";
    } catch (e) {
      return "Error while adding user: " + e.toString();
    }
  }

  Future<Object?> getUser({required String phone_number}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(phone_number).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return e;
    }
  }

  Future<bool> checkUserExists({required String phone_number}) async {
    try{
      final response = await http.get(
        Uri.parse('${Config.REGISTER}/${phone_number}')
      );

      print("response from check User: "+ response.body);

      return Future.value(jsonDecode(response.body)["message"]);
    }
    catch (e){
      return Future.error(e);
    }
  }
}
