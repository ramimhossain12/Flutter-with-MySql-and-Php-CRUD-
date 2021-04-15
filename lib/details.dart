import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Details extends StatefulWidget {

  List list;
  int index;


  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('${widget.list[widget.index]['name']}'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
          widget.list[widget.index]['name'],
          style: TextStyle(fontSize: 20.0),
        ),
            Text(
              widget.list[widget.index]['mobile'],

            ),
            MaterialButton(
              child: Text("Edit"),
              color: Colors.deepPurpleAccent,
              onPressed: (){},
            ),
            MaterialButton(
              child: Text("Delete"),
              color: Colors.deepPurpleAccent,
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
