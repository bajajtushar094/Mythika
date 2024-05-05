class Config{
  static String LOCAL_SERVER_URL = "http://10.0.2.2:8080";
  static String LOCAL_SERVER_URL_IP = "http://127.0.0.1:5000";

  static String REGISTER = '$LOCAL_SERVER_URL/auth';
  static String LOGIN = '$LOCAL_SERVER_URL/auth/login';
  static String SYMPTOM = '$LOCAL_SERVER_URL/symptom';
  static String QUESTION = '$LOCAL_SERVER_URL/questionaire';
  static Map<String, String> headers = {"Content-Type": "application/json"};
}