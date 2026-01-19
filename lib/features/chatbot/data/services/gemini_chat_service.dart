import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiChatService {
  static const _apiKey = "Gen-lang-client-0687222082";

  Future<String> sendMessage(String userMessage) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_apiKey",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "You are Sajilo Upachar AI, a safe medical assistant. "
                    "Give basic guidance only. Do not diagnose. "
                    "User: $userMessage"
              }
            ]
          }
        ]
      }),
    );

    final data = jsonDecode(response.body);
    return data["candidates"][0]["content"]["parts"][0]["text"];
  }
}
