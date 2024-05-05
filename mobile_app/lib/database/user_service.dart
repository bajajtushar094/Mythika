import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/globals/config.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<String?> addUser(final payload) async {
    try {
      // CollectionReference users =
      //     FirebaseFirestore.instance.collection("users");
      // await users.doc(phone_number).set({
      //   'name': name,
      // });

      final response = await http.post(
          Uri.parse(Config.REGISTER),
          headers: Config.headers,
          body:jsonEncode(
              payload
          )
      );

      return response.body;
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

  Future<String?> checkUserExists({required String phone_number}) async {
    try{
      final response = await http.get(
        Uri.parse('${Config.REGISTER}/${phone_number}')
      );

      print("response from check User: "+ response.body);

      return response.body;
    }
    catch (e){
      return "Error while checking user: " + e.toString();
    }
  }
}
