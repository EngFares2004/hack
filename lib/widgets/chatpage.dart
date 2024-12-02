import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String doctorName;
  final String doctorImage;

  const ChatPage({
    super.key,
    required this.doctorName,
    required this.doctorImage,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({"text": message, "isClient": true, "time": _currentTime()});
      });
      _messageController.clear();
    }
  }

  String _currentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.doctorImage),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.doctorName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // رسائل الدردشة
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessage(
                  message["text"],
                  message["isClient"],
                  message["time"],
                );
              },
            ),
          ),

          // واجهة إدخال الرسائل
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                  onPressed: () {
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.mic, color: Theme.of(context).primaryColor),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String message, bool isClient, String time) {
    return Align(
      alignment: isClient ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isClient ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isClient ? Colors.purple[300] : Colors.purple[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isClient ? 12 : 0),
                topRight: Radius.circular(isClient ? 0 : 12),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isClient ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
