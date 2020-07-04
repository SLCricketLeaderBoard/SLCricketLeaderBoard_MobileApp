import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Drawer/drawer.dart';

class Profile extends StatelessWidget {
  var value;
  Profile({Key key, this.value}) : super(key: key);


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

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        this.value["fullName"],
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Email: " +this.value["email"] + "\n" +
        "NIC   : " + this.value["nic"] + "\n" +
        "Contact :" + this.value["contactNumber"] + "\n"+
        "Reg Date :" + this.value["regDate"] + "\n",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );


    return Scaffold(
      appBar: new AppBar(
        title: new Text("profile"),
        backgroundColor: Colors.grey[500],
      ),
      backgroundColor: Colors.grey[800],
      body: body,
      drawer: AppDrawer(value:this.value),
    );
  }
}