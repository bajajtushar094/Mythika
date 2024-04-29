import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/globals/config.dart';

class SymptomService{
  Future<String?> addSymptom(final payload) async {
    try{
      final response = await http.post(
          Uri.parse(Config.SYMPTOM),
          headers: Config.headers,
          body:jsonEncode(
              payload
          )
      );


      if(response.statusCode==200) {
        return "Success";
      }
      else{
        return response.body;
      }
    }
    catch(e){
      return "Error :" + e.toString();
    }
  }
}