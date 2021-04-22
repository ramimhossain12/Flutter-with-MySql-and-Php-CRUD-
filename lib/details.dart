import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/editdata.dart';
import 'package:flutter_mysql_crud/main.dart';

import 'package:http/http.dart' as http;


class Details extends StatefulWidget {

  List list;
  int index;


  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  void delete(){
    var url = "http://192.168.0.103/php/myfolder/deletedata.php";
    http.post(url,body: {
      'id':widget.list[widget.index],

    });
  }

void confirm(){

  AlertDialog alertDialog = new AlertDialog(
    content: Text("Are You Sure?"),
    actions: [
      MaterialButton(
        child: Text("OK DELETE"),
        onPressed: (){
          delete();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context)=>Home())
          );
        },
      ),
      MaterialButton(
        child: Text("CANCEL"),
        onPressed: (){},
      ),

    ],
  );

}
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
              onPressed: ()=>Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)),
              ),
            ),
            MaterialButton(
              child: Text("Delete"),
              color: Colors.deepPurpleAccent,
              onPressed: ()=>confirm(),
            )
          ],
        ),
      ),
    );
  }
}
