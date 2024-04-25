import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class BrainFogService {
  Future<String?> addBrainFog(
      {required String phone_number,
      required double impact,
      required String note}) async {
    try {
      // CollectionReference brain_fog =
      //     FirebaseFirestore.instance.collection("brain_fog");
      //
      // await brain_fog.doc(phone_number).set({"data":[{"impact": impact, "note": note}]});
      DatabaseReference postListRef = FirebaseDatabase.instance.ref("posts");
      DatabaseReference newPostRef = postListRef.push();
      newPostRef.set({"impact": impact, "note": note});


      return "Brain Fog added";
    } catch (e) {
      print("Error from brain fog: "+ e.toString());
      return "Error";
    }
  }
}
