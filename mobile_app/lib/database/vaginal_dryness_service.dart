import 'package:cloud_firestore/cloud_firestore.dart';

class VaginalDrynessService {
  Future<String?> addVagnialDryness(
      {required String phone_number,
        required double severity,
        required double sexual,
        required double daily,
        required int frequency,
        required bool tracking}) async {
    try {
      CollectionReference vaginal_dryness =
      FirebaseFirestore.instance.collection("vaginal_dryness");

      await vaginal_dryness.doc(phone_number).set({"severity": severity, "sexual": sexual, "daily":daily, "frequency":frequency, "tracking":tracking});

      return "Vaginal Dryness added";
    } catch (e) {
      return "Error while adding Vaginal Dryness: " + e.toString();
    }
  }
}
