import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<int> fetchHttpMessage(messageEnvoye) async {
  print('Sending message to server...');
  var response =
      await http.get('http://192.168.153.25:5000/test/post/'+messageEnvoye);
  print('Message sent to server!');
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    // If the server did return a 200 OK response, then parse the JSON.
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to send messsage');
  }
}

Future<HttpMessage> getHttpMessage() async {
  print('on fait un pull');
  final response =
      await http.get('http://192.168.152.25:5000/test/pull');
  print('pull done');
  if (response.statusCode == 200) {
    print('ici');
    return HttpMessage.fromJson(json.decode(response.body));
  } else {
    print('là');
    throw Exception('Failed to get message');
  }
}


class HttpMessage {
  final int id;
  final String content;
  final String ts;

  HttpMessage({this.id, this.content, this.ts});

  factory HttpMessage.fromJson(Map<String, dynamic> json) {
    return HttpMessage(
      id: json['id'],
      content: json['content'],
      ts: json['ts']
    );
  }
}