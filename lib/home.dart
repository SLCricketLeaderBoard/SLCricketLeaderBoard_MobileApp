import 'dart:ui';

import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import './login.dart';
import 'calculator.dart';
import 'calender.dart';
import 'web.dart';  
import 'review.dart';
import 'update.dart';
import 'note.dart';

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
    

    final content = Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing:20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width:160.0,
                      height: 160.0,

                      child: Card(

                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            child: Column(
                            children: <Widget>[
                               MaterialButton(
                               child: Text("Profile"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => WebPage()),
                                   );
                  },
                                color: Colors.red,
                                   )
                              
                            ],
                            
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                    
                      child: Card(

                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/note.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  
                                  Text(
                                    "Notes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "12 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(

                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/calendar.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Agenda",
                                    style: TextStyle(
                                        color: Colors.white,
                                         fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "4 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(

                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/settings.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
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
              if (value == Constants.ThirdItem) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }
            },
            
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
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
      body: content,
      drawer: AppDrawer(value: this.value),
    );
  }
}
