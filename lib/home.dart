import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Drawer/drawer.dart';



class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  var value;
  HomePage({Key key, this.value}) : super(key: key);

  static String tag = 'home-page';


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
      child: Text( "Home" + "\n" + this.value["nic"],
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[ welcome, lorem],
      ),
    );


    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.grey[500],
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Container(
              width: 63,
              height: 63,
              child: alucard,
            ),)
        ],
      ),
      backgroundColor: Colors.grey[800],
      body: body,
      drawer: AppDrawer(value:this.value),
    );
  }
}