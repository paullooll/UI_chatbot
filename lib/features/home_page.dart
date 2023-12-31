// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cc206_chatbot_application/chat/chatdetails.dart';
import 'package:cc206_chatbot_application/chat/chatmessage.dart';
import 'package:cc206_chatbot_application/chat/sendmenu.dart';
import 'package:cc206_chatbot_application/chat/bubble.dart';

enum MessageType {
  Sender,
  Receiver,
}

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "What is Flutter?", type: MessageType.Sender),
    ChatMessage(
        message:
            "Flutter is an open-source mobile application development framework developed by Google that allows developers to build high-quality native Android and iOS apps from a single codebase using the Dart programming language. It provides a widget-based UI framework to build beautiful apps quickly, and compiles to high-performance native code so apps feel indistinguishable from those built using native development. Flutter aims to help developers more easily deliver great mobile experiences on both platforms.",
        type: MessageType.Receiver),
    ChatMessage(message: "How to design in Flutter?", type: MessageType.Sender),
    ChatMessage(
        message:
            "In Flutter, app design starts with organizing UI elements as Widgets which can be combined to build up any UI, from simple to complex. Common Widgets include Containers to lay out and style elements, Text for displaying text content, Images to include pictures, Buttons for user interaction and many more. Designs are prototyped by nesting these Widgets with specific properties in code, allowing for rapid iteration as visual changes take effect instantly once hot reloaded in the emulator or device.",
        type: MessageType.Receiver),
    ChatMessage(
        message:
            "How is Flutter different from other programming languages?",
        type: MessageType.Sender),
    ChatMessage(
        message:
            "Unlike traditional frameworks, Flutter uses its own widget-based reactive framework that allows building native UIs instead of web views for both Android and iOS with a single codebase. It compiles to native code instead of interpreting at runtime, providing smooth performance on par with native development. Flutter also introduces the declarative programming style with widgets, streamlining the development process and simplifying complex UI logic through its reactive approach.",
        type: MessageType.Receiver),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(
        text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(
        text: "Document",
        icons: Icons.insert_drive_file,
        color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(
        text: "Location", icons: Icons.location_on, color: Colors.green),
  ];

  void showModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: 10.0,
            height: MediaQuery.of(context).size.height / 2,
            color: const Color(0xff737373),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index]
                                  .color
                                  .shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              menuItems[index].icons,
                              size: 20,
                              color: menuItems[index]
                                  .color
                                  .shade400,
                            ),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatDetailPageAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    itemCount: chatMessage.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        chatMessage: chatMessage[index], width: 10.0,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              height: 60,
              width: double.infinity,
              color: Colors.blue,
              child: Stack(
                children: [
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModal();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 21,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type message...",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle icon tap
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
