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
        padding: EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(this.value["profileImage"]),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        this.value["userName"],
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final card = Container(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.teal[900],
              ),
              title: Text(
                this.value["fullName"],
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.teal[900],
              ),
              title: Text(
                this.value["email"],
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.person_pin,
                color: Colors.teal[900],
              ),
              title: Text(
                this.value["nic"],
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.add_location,
                color: Colors.teal[900],
              ),
              title: Text(
                this.value["address"],
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.teal[900],
              ),
              title: Text(
                this.value["contactNumber"],
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.teal[900],
              ),
              title: Text(
                this.value["regDate"],
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
              ),
            ),
          ),
        ]
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[alucard, welcome, card],
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