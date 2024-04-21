import 'package:cloud_firestore/cloud_firestore.dart';

class NightSweatsService {
  Future<String?> addNightSweats(
      {required String phone_number,
        required double intensity,
        required double sleep,
        required double daily,
        required int frequency,
        required bool tracking}) async {
    try {
      CollectionReference night_sweats =
      FirebaseFirestore.instance.collection("night_sweats");

      await night_sweats.doc(phone_number).set({"intensity": intensity, "sleep": sleep, "daily":daily, "frequency":frequency, "tracking":tracking});

      return "Night Sweats added";
    } catch (e) {
      return "Error while adding Night Sweats: " + e.toString();
    }
  }
}
