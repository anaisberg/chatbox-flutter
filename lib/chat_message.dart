import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/chat_screen.dart';
import 'package:whatsapp/whatsapp_home.dart';

const String _nameGet = "Ana";
const String _nameSend = "Theo";

class ChatMessage extends StatelessWidget{
    
  final String text ;
  final int id;
  final bool our;
  

  ChatMessage({this.text, this.id, this.our});

  @override 
  Widget build(BuildContext context){
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              backgroundColor: Colors.pink[100],
              child: new Text(
                our ? _nameGet[0] : _nameSend[0],
                style: TextStyle(
                  color: Colors.black45
                ),
              ),
            )
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(our ? _nameGet : _nameSend, style: Theme.of(context).textTheme.subhead,),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      )
    );
  }
}