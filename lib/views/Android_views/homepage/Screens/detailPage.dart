import 'package:flutter/material.dart';
import 'package:platform_converter_app/Modal/modal.dart';
import 'package:platform_converter_app/Providers/callDataProvider.dart';
import 'package:platform_converter_app/Providers/chatDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatDetailPage extends StatelessWidget {
  final int chatIndex;

  const ChatDetailPage({required this.chatIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        actions: [
          IconButton(
            onPressed: () async {
              final uri = Uri.parse("tel:${contact.contact}");
              if (await canLaunch(uri.toString())) {
                await launch(uri.toString());
                Provider.of<CallDataProvider>(context, listen: false).addCall(
                  Contact(
                    name: contact.name,
                    contact: contact.contact,
                    timestamp: DateTime.now(),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.call,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatDataProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.chatData.length,
                  itemBuilder: (context, index) {
                    final chat = provider.chatData[index];
                    return ChatBubble(
                      message: chat['message'],
                      isSentByMe: chat['isSentByMe'],
                    );
                  },
                );
              },
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String? message;
  final bool? isSentByMe;

  const ChatBubble({this.message, this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSentByMe! ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSentByMe! ? Colors.green[300] : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message!,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final provider = Provider.of<ChatDataProvider>(context, listen: false);

    return Container(
      height: 80,
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              size: 35,
            ),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                provider.sendMessage(controller.text);
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
