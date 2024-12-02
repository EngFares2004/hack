import 'package:flutter/material.dart';

class DoctorChatScreen extends StatelessWidget {
  const DoctorChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFE5D1FA),
        leading: IconButton(
          icon:
          const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: Container(
        color: Color(0xFFE5D1FA),
        child: Column(
          children: [
            Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Color(0xFFB77EFF))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(
                    fit: BoxFit.cover,
                    "https://cdn.pixabay.com/photo/2024/09/03/15/21/ai-generated-9019520_640.png"),
              ),
            ),
            Text(
              "Dr. Kalini Jithma",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildChatBubble("Hello", true),
                  _buildChatBubble("Hi, How can I assist you today?", false),
                  const SizedBox(height: 10),
                  _buildChatBubble("what are you doing?", true),
                  const SizedBox(height: 10),
                  _buildChatBubble(
                      "I'm here to assist you! You can ask me questions, seek information on various topics, or just chat. How can I help you today?",
                      false),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 14,
                ),
                _buildQuickReplyButton("How Are You Today?"),
                const SizedBox(width: 8),
                _buildQuickReplyButton("Thank you"),
              ],
            ),
            _buildInputSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBubble(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color:
          isUser ? Colors.purple.shade200 : Color.fromARGB(126, 26, 26, 26),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Color(0xFFE5D1FA),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickReplyButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}