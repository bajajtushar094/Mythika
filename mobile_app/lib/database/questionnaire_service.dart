import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/globals/config.dart';

class QuestionnaireService {
  Future<String?> addQuestion(final payload) async {
    try{
      final response = await http.post(
        Uri.parse(Config.QUESTION),
        headers: Config.headers,
        body: jsonEncode(
          payload
        )
      );

      return response.body;
    }
    catch(e){
      return e.toString();
    }
  }
}