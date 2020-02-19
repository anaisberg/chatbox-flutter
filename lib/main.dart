import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'whatsApp',
      theme: ThemeData(
        primaryColor: Colors.green[400],
        accentColor: Colors.green[100]
      ),
      home: new WhatsAppHome(),
    );
  }
}
