import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Edit extends StatefulWidget {

  final List list;
  final int index;


  Edit({this.list, this.index});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  TextEditingController cname;
  TextEditingController cmobile;


  void editData(){
    var url = "http://192.168.0.103/php/myfolder/editdata.php";
    http.post(url,body: {

      'id':widget.list[widget.index]['id'],
      'name': cname.text,
       'mobile':cmobile.text,
    });
  }

  @override
  void initState() {

    cname = TextEditingController(text: widget.list[widget.index]['name']);
    cmobile = TextEditingController(text: widget.list[widget.index]['mobile']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(

        title: Text("Edit Data ${widget.list[widget.index]['name']}"),
      ),

      body: ListView(
        children: [
          TextField(
            controller: cname,
            decoration: InputDecoration(hintText: "Enter Name",labelText: "Enter Name"),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(hintText: "Enter Mobile",labelText: "Enter Mobile"),

          ),

          MaterialButton(
            child: Text("Edit Data"),
            onPressed: (){
              editData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> Home()),
              );
            },
          )
        ],
      ),
    );
  }
}
