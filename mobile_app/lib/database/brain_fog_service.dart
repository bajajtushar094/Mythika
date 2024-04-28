import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/globals/config.dart';

class BrainFogService {
  Future<String?> addBrainFog(
      {required String phone_number,
      required double impact,
      required String note}) async {
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.post(
        Uri.parse(Config.SYMPTOM),
        headers: headers,
        body:jsonEncode(
            {
              "mobile": phone_number,
              "symptom_name": "brain_fog",
              "symptom_fields":[
                {
                  "name":"impact",
                  "value":impact
                },
                {
                  "name":"note",
                  "value":note
                }
              ]
            }
        )
      );

      print("response from brain fog: "+response.toString());


      return "Brain Fog added";
    } catch (e) {
      print("Error from brain fog: "+ e.toString());
      return "Error";
    }
  }
}
