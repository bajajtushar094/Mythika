import 'package:cloud_firestore/cloud_firestore.dart';

class WeightService {
  Future<String?> addWeight(
      {required String phone_number,
        required double w_impact,
        required int w_earlier,
        required int w_later,
        required int w_time}) async {
    try {
      CollectionReference weight =
      FirebaseFirestore.instance.collection("weight");

      await weight.doc(phone_number).set({"w_impact": w_impact, "w_earlier": w_earlier, "w_later":w_later, "w_time":w_time});

      return "Weight added";
    } catch (e) {
      return "Error while adding weight: " + e.toString();
    }
  }
}
