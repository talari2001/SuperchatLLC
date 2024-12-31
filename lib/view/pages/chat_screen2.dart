import 'package:flutter/material.dart';

class ChatScreen2 extends StatelessWidget {
  const ChatScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.more_horiz, color: Colors.black),
          onPressed: () {
            print("Menu button tapped!");
          },
        ),
        title: const Text(
          'Superchat LLC',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background
          Container(color: Colors.white),
          // Main Chat UI
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: const [
                    ChatBubble(
                      message: "Hello!",
                      isSentByMe: true,
                    ),
                    ChatBubble(
                      message: "Hello! Nice to chat with you today!",
                      isSentByMe: false,
                    ),
                  ],
                ),
              ),
              CustomInputBar(),
            ],
          ),
          // External Circular Button
          Positioned(
            bottom: 11,
            right: 8,
            child: CircleAvatar(
              radius: 21,
              backgroundColor: Colors.black,
              child: IconButton(
                icon: const Icon(Icons.waves_outlined, color: Colors.white),
                onPressed: () {
                  print("External button pressed");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatBubble(
      {super.key, required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isSentByMe
                ? const Radius.circular(20)
                : const Radius.circular(0),
            bottomRight: isSentByMe
                ? const Radius.circular(0)
                : const Radius.circular(20),
          ),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
    );
  }
}

class CustomInputBar extends StatelessWidget {
  const CustomInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildCustomButton("PDF"),
                  const SizedBox(width: 8),
                  _buildCustomButton("CSV"),
                  const SizedBox(width: 8),
                  _buildCustomButton("Chat"),
                ],
              ),
              Row(
                children: [
                  _buildIconButton(Icons.mic),
                  const SizedBox(width: 8),
                  _buildIconButton(Icons.upload_file),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Input Box with Send Button
          Row(
            children: [
              // Input Box
              Container(
                width: MediaQuery.of(context).size.width *
                    0.7, // 70% of screen width
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.white,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                  width: 5), // Space between input box and send button
              // Send Button
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    print("Send message");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Icon(icon, color: Colors.black),
    );
  }
}
