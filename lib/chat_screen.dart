import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/http_message.dart';
import 'package:whatsapp/chat_message.dart';

class ChatScreen extends StatefulWidget{
  @override 
  ChatScreenState createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
    
  // _privateField
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];
  Future<HttpMessage> futureMessage;
  var lastId = 0;
  
  void _handleSubmitted(String text) async {
    //clears the text field once message send
    _textController.clear();
    var idEnvoye = await fetchHttpMessage(text);

  }

  // final timeout = const Duration(seconds: 3);
  // final ms = const Duration(milliseconds: 1);

  Timer startTimeout([int milliseconds]) {
    var duration = Duration(milliseconds: milliseconds);
    return new Timer.periodic(duration, callback);
  }
  void callback(Timer t) async {  // callback function
    var result = await getHttpMessage();
    setState(() {
      if (result.id != lastId) {
        print('New message received from server!');
        print(result.content);
        _messages.insert(0,new ChatMessage(text: result.content));
        lastId = result.id;
      }
    });
  }


  Widget _textComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.green[400]),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                  //occupies all the space
                  hintText: "Aa", //light display
                  //submit the text when written
                ),
                onSubmitted: _handleSubmitted,
                controller: _textController,
              ),

  
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send), 
                onPressed: () => _handleSubmitted(_textController.text),
              ),


            )
          ],
        ),
        
         
      ),
    );
  }

  @override 
  Widget build(BuildContext context) {
    startTimeout(1000);
    return new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              //generate from the bottom of the screen
              reverse: true,
              //item builder takes a buildContext (_, no need for name) and an index as argument
              itemBuilder: (_,int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _textComposer(),
          ),
        ],
      ); 
  }
}
