import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/chat_message.dart';

class ChatScreen extends StatefulWidget{
  @override 
  ChatScreenState createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
    
  // _privateField
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];



  void _handleSubmitted(String text){
    //clears the text field once message send
    _textController.clear();
    //list updated with the message
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState((){
      _messages.insert(0,message);
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
                  hintText: "message", //light display
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