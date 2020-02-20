import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp_home.dart';

// void main() => runApp(MyApp());

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

var _currentOpacity = 1.0; 

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
        // appBar: AppBar(
        //   title: Text('First Screen'),
        // ),
        body: AnimatedOpacity (
          opacity: _currentOpacity,
          duration: const Duration(seconds: 1),
          child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'images/clouds.png',
                        fit: BoxFit.fitHeight ,
                        height: 2220,
                        repeat: ImageRepeat.repeat,
                      ),

              Center(
                child: RaisedButton(
                  child: Icon(
                    Icons.arrow_upward,
                    size: 70,
                    color: Colors.purple[100]
                  ),
                  
                  //Text('start chatting'),
                  shape: new CircleBorder(),
                  
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/second');
                    _currentOpacity = 0.0 ;
                    
                  },
                ),
              )
            ]
          ),
        ),
      ),
      
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'whatsApp',
      theme: ThemeData(
        primaryColor: Colors.pink[300],
        accentColor: Colors.pink[100]
      ),
      home: new WhatsAppHome(),
    );
  }
}
