import 'package:cloud_firestore/cloud_firestore.dart';

class PeriodsService {
  Future<String?> addPeriods(
      {required String phone_number,
        required int once,
        required int duration,
        required int pads,
        required double impact,
        required double pain}) async {
    try {
      CollectionReference periods =
      FirebaseFirestore.instance.collection("periods");

      await periods.doc(phone_number).set({"once": once, "duration": duration, "pads":pads, "impact":impact, "pain":pain});

      return "Periods added";
    } catch (e) {
      return "Error while adding period: " + e.toString();
    }
  }
}
