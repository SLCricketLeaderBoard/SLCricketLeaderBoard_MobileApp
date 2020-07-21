<<<<<<< HEAD
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import './login.dart';

class Constants {

  // static const String FirstItem = 'First Item';
  // static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Logout';

  static const List<String> choices = <String>[
    // FirstItem,
    // SecondItem,
    ThirdItem,
  ];
}


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
      child: Text( "DashBoard",
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
            PopupMenuButton<String>(
              child: Container(
                width: 63,
                height: 63,
                child: alucard,
              ),
              onSelected: (value) {
                if(value == Constants.ThirdItem){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(

                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
        ],
      ),
      backgroundColor: Colors.grey[800],
      body: body,
      drawer: AppDrawer(value:this.value),
    );
  }
}
=======
>>>>>>> fdad719135a270d332a9db9d3d1f803f8f711f76
