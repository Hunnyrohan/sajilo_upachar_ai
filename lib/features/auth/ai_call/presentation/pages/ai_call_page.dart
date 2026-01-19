import 'package:flutter/material.dart';
import 'package:sajilo_upachar_ai/features/chatbot/data/services/gemini_chat_service.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';


class AICallPage extends StatefulWidget {
  const AICallPage({super.key});

  @override
  State<AICallPage> createState() => _AICallPageState();
}

class _AICallPageState extends State<AICallPage> {
  final SpeechToText _speech = SpeechToText();
  final FlutterTts _tts = FlutterTts();
  final GeminiChatService _gemini = GeminiChatService();

  String status = "Tap mic and speak";

  Future<void> startCall() async {
    await _speech.initialize();
    await _speech.listen(onResult: (result) async {
      final text = result.recognizedWords;
      setState(() => status = "Thinking...");

      final reply = await _gemini.sendMessage(text);
      await _tts.speak(reply);

      setState(() => status = "AI Nurse speaking...");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Nurse Call")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 120, color: Colors.teal),
          const SizedBox(height: 20),
          Text(status),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: startCall,
            child: const Icon(Icons.mic),
          )
        ],
      ),
    );
  }
}
