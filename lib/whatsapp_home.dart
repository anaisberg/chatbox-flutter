import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen.dart';
import 'package:flutter/rendering.dart';

class WhatsAppHome extends StatefulWidget {
  @override 
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MSI - Chatbox'),
        elevation: 1,
      ),
      body: new ChatScreen(),
      // new ChatScreen(),
    );
  }
}