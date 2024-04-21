import 'package:cloud_firestore/cloud_firestore.dart';

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
}
