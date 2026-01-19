import 'package:flutter/material.dart';
import '../../../../core/services/backend_service.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final BackendService _backend = BackendService();
  final TextEditingController _controller = TextEditingController();

  bool _isTyping = false;

  final List<Map<String, dynamic>> _messages = [
    {"text": "Hello 👋 I am Sajilo AI. How can I help you?", "isUser": false},
  ];

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({"text": text, "isUser": true});
      _controller.clear();
      _isTyping = true;
    });

    final reply = await _backend.sendChat(text);

    setState(() {
      _messages.add({"text": reply, "isUser": false});
      _isTyping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI ChatBot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (_, i) {
                if (_isTyping && i == _messages.length) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text("AI is typing..."),
                  );
                }

                final msg = _messages[i];
                return Align(
                  alignment: msg["isUser"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg["isUser"] ? Colors.teal : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      msg["text"],
                      style: TextStyle(
                        color: msg["isUser"] ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Type message...",
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              IconButton(icon: const Icon(Icons.send), onPressed: _send),
            ],
          ),
        ],
      ),
    );
  }
}
