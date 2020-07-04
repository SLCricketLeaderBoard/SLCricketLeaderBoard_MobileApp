import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import './Drawer/drawer.dart';

class Chat extends StatelessWidget {
  var value;
  Chat({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(this.value["profileImage"]),
        ),
      ),
    );


    final bodyDetails = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text( "Chat",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[ bodyDetails],
      ),
    );


    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.grey[500],
      ),
      backgroundColor: Colors.grey[800],
      body: body,
      drawer: AppDrawer(value:this.value),
    );
  }

}