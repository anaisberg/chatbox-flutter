import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const String _nameGet = "Elève";
const String _nameSend = "Anaïs";

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
              backgroundColor: our ? Colors.grey[300] : Colors.pink[100],
              child: new Text(
                our ? _nameSend[0] : _nameGet[0],
                style: TextStyle(
                  color: Colors.black45
                ),
              ),
            )
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(our ? "Vous" : _nameGet, style: Theme.of(context).textTheme.subhead,),
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