import 'package:flutter/material.dart';
import 'package:whatsapp/main.dart';


void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyWelcomeApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => MyApp(),
    },
  ));
}

class MyWelcomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'whatsApp',
      theme: ThemeData(
        primaryColor: Colors.pink[300],
        accentColor: Colors.pink[100]
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('start chatting'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/second');
            },
          ),
        ),
      ),
      
    );
  }
}