import 'dart:ui';

import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import './login.dart';
import 'calculator.dart';
import 'calender.dart';
import 'web.dart';  
import 'review.dart';
import 'setting.dart';
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
                              Image.asset("assets/todo.png",width: 80.0,),
                               MaterialButton(
                               child: Text("Calender"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => CalenderPage()),
                                   );
                  },
                                color: Colors.blue[500],
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
                              Image.asset("assets/calc1.png",width: 75.0,),
                              
                            
                               MaterialButton(
                               child: Text("Calculator"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => CalculatorPage()),
                                   );
                  },
                                color: Colors.blue[500],
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
                              Image.asset("assets/li1.png",width: 70.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                               MaterialButton(
                               child: Text("Live"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => WebPage()),
                                   );
                  },
                                color: Colors.blue[500],
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
                              Image.asset("assets/re1.png",width: 80.0,),
                               MaterialButton(
                               child: Text("Review"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => ReviewPage()),
                                   );
                  },
                                color: Colors.blue[500],
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
                              Image.asset("assets/se1.png",width: 72.0,),
                               MaterialButton(
                               child: Text("Setting"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => SettingPage()),
                                   );
                  },
                                color: Colors.blue[500],
                                   )
                              
                            ],
                            
                            ),
                          )
                        ),
                      ),
                    ),SizedBox(
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
                              Image.asset("assets/pr1.png",width: 80.0,),
                               MaterialButton(
                               child: Text("Profile"),
                                  onPressed: (
                                    
                                  ) {
                                 Navigator.push(
                                 context,
                                MaterialPageRoute(builder: (context) => WebPage()),
                                   ); 
                  },
                                color: Colors.blue[500],
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
        
        title: new Text("WELCOME CRICKDOM"
        
        ),

        backgroundColor: Colors.lightBlue,
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
      backgroundColor: Colors.blue[900],
      body: content,
      drawer: AppDrawer(value: this.value),
    );
  }
}
