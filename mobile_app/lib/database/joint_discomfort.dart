import 'package:cloud_firestore/cloud_firestore.dart';

class JointDiscomfortService {
  Future<String?> addJointDiscomfort(
      {required String phone_number,
        required String radiate,
        required String relieve,
        required String worsen,
        required int pain,
        required int onset,
        required int worst,
        required double severity,
        required int hurt,
        required int j_char}) async {
    try {
      CollectionReference joint_discomfort =
      FirebaseFirestore.instance.collection("joint_discomfort");

      await joint_discomfort.doc(phone_number).set({"radiate": radiate, "relieve": relieve, "worsen":worsen, "pain":pain, "onset":onset, "worst":worst, "severity":severity, "hurt":hurt, "j_char":j_char});

      return "Joint discomfort added";
    } catch (e) {
      return "Error while adding Joint discomfort: " + e.toString();
    }
  }
}
