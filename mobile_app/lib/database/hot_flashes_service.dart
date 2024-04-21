import 'package:cloud_firestore/cloud_firestore.dart';

class HotFlashesService {
  Future<String?> addHotFlashes(
      {required String phone_number,
        required double intensity,
        required double sleep,
        required double daily,
        required int frequency,
        required bool tracking
      }) async {
    try {
      CollectionReference hot_flashes =
      FirebaseFirestore.instance.collection("hot_flashes");

      await hot_flashes.doc(phone_number).set({"intensity": intensity, "daily": daily, "sleep":sleep, "frequency":frequency, "tracking":tracking});

      return "Hot Flashes added";
    } catch (e) {
      return "Error while adding Hot Flashes: " + e.toString();
    }
  }
}
