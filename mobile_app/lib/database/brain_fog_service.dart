import 'package:cloud_firestore/cloud_firestore.dart';

class BrainFogService {
  Future<String?> addBrainFog(
      {required String phone_number,
      required double impact,
      required String note}) async {
    try {
      CollectionReference brain_fog =
          FirebaseFirestore.instance.collection("brain_fog");

      await brain_fog.doc(phone_number).set({"impact": impact, "note": note});

      return "Brain Fog added";
    } catch (e) {
      return "Error while adding brain fog: " + e.toString();
    }
  }
}
