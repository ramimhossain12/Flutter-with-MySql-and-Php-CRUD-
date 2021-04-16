import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {

  TextEditingController cname = new TextEditingController();
  TextEditingController cmobile = new TextEditingController();
  void addData(){


    var url = "http://192.168.0.103/php/myfolder/adddata.php";
    http.post(url,body: {

      "name": cname.text,
      "mobile": cmobile.text,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),

      ),
      body: ListView(
        children: [
          TextField(
            controller: cname ,
            decoration: InputDecoration(hintText: "Enter Name",labelText: "Enter Name"),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(hintText: "Enter Mobile",labelText: "Enter Moblile"),
          ),
          MaterialButton(

            child: Text("Add Data"),
            color:  Colors.red,
            onPressed: (){
              addData();
              Navigator.of(context).push(

                MaterialPageRoute(builder: (BuildContext context)=>Home()),
              );
            },
          ),
        ],
      ),
    );
  }
}
