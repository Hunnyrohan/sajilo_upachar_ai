import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendService {
  static const String baseUrl = "http://10.0.2.2:5000"; 
  // ⚠️ Android emulator uses 10.0.2.2 for localhost

  Future<String> sendChat(String message) async {
    final response = await http.post(
      Uri.parse("$baseUrl/chat"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"message": message}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["reply"];
    } else {
      return "⚠️ Backend error";
    }
  }
}
