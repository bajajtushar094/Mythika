import 'package:cloud_firestore/cloud_firestore.dart';

class SkinRashesService {
  Future<String?> addSkinRashes(
      {required String phone_number,
        required double well,
        required double daily,
        required int duration,
        required int size,
        required int loc}) async {
    try {
      CollectionReference skin_rashes =
      FirebaseFirestore.instance.collection("skin_rashes");

      await skin_rashes.doc(phone_number).set({"well": well, "daily": daily, "duration":duration, "size":size, "loc":loc});

      return "Skin Rashes added";
    } catch (e) {
      return "Error while adding skin rashes: " + e.toString();
    }
  }
}
