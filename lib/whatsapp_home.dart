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
        title: new Text(
          'msi chatbox',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        elevation: 0.7,
        centerTitle: true,
        
      ),
      body: new ChatScreen(),
      // new ChatScreen(),
    );
  }
}