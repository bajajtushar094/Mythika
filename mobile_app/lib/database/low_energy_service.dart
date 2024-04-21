import 'package:cloud_firestore/cloud_firestore.dart';

class BrainFogService {
  Future<String?> addLowEnergy(
      {required String phone_number,
        required double frequency,
        required double impact,
        required int duration,
        required int onset,
        required int trigger,
        required int condition,
        required int worst,
        required String text}) async {
    try {
      CollectionReference low_energy =
      FirebaseFirestore.instance.collection("low_energy");

      await low_energy.doc(phone_number).set({"frequency": frequency, "impact": impact, "duration":duration, "onset":onset, "trigger":trigger, "condition":condition, "worst":worst, "text":text});

      return "Low energy added";
    } catch (e) {
      return "Error while adding low energy: " + e.toString();
    }
  }
}
