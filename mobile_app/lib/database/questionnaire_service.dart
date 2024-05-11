import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/config.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
import 'package:get/get.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';

class QuestionnaireService {
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  UserController userController = Get.put(UserController());
  Future<String?> addQuestion() async {
    try{
      List<dynamic> questions_array = [];
      questionnaireController.questions.forEach((k, v)  {
        questions_array.add(v);
      });

      final response = await http.post(
        Uri.parse(Config.QUESTION),
        headers: Config.headers,
        body: jsonEncode({
          "mobile":userController.phone_number.value,
          "questions":questions_array
        }
        )
      );

      return response.body;
    }
    catch(e){
      return e.toString();
    }
  }
}