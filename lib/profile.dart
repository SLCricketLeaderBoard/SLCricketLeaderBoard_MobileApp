import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
// import 'package:division/division.dart';

class Profile extends StatelessWidget {
  var value;
  Profile({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final alucard = Hero(
    //   tag: 'hero',
    //   child: Padding(
    //     padding: EdgeInsets.all(2.0),
    //     child: CircleAvatar(
    //       radius: 50.0,
    //       backgroundColor: Colors.transparent,
    //       backgroundImage: NetworkImage(this.value["profileImage"]),
    //     ),
    //   ),
    // );

    // final welcome = Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Text(
    //     this.value["userName"],
    //     style: TextStyle(fontSize: 28.0, color: Colors.white),
    //   ),
    // );

    // final card = Container(
    //   child: Column(children: <Widget>[
    //     Card(
    //       color: Colors.white,
    //       margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.person,
    //           color: Colors.teal[900],
    //         ),
    //         title: Text(
    //           this.value["fullName"],
    //           style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
    //         ),
    //       ),
    //     ),
    //     Card(
    //       color: Colors.white,
    //       margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.email,
    //           color: Colors.teal[900],
    //         ),
    //         title: Text(
    //           this.value["email"],
    //           style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
    //         ),
    //       ),
    //     ),
    //     Card(
    //       color: Colors.white,
    //       margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.person_pin,
    //           color: Colors.teal[900],
    //         ),
    //         title: Text(
    //           this.value["nic"],
    //           style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
    //         ),
    //       ),
    //     ),
    //     Card(
    //       color: Colors.white,
    //       margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.add_location,
    //           color: Colors.teal[900],
    //         ),
    //         title: Text(
    //           this.value["address"],
    //           style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
    //         ),
    //       ),
    //     ),
    //     Card(
    //       color: Colors.white,
    //       margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.phone,
    //           color: Colors.teal[900],
    //         ),
    //         title: Text(
    //           this.value["contactNumber"],
    //           style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
    //         ),
    //       ),
    //     ),
    //     Card(
    //       color: Colors.white,
    //       margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.date_range,
    //           color: Colors.teal[900],
    //         ),
    //         title: Text(
    //           this.value["regDate"],
    //           style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
    //         ),
    //       ),
    //     ),
    //   ]),
    // );

    // final body = Container(
    //   width: MediaQuery.of(context).size.width,
    //   padding: EdgeInsets.all(28.0),
    //   child: Column(
    //     children: <Widget>[alucard, welcome, card],
    //   ),
    // );

    final body = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueAccent, Colors.purpleAccent])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          this.value["profileImage"],
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        this.value["userName"],
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Posts",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "5200",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Followers",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "28.5K",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Follow",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "1300",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.account_box),
                          title: Text("Full Name",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Neucha',
                              )),
                          subtitle: Text(value["fullName"],
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Neucha',
                              )),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_box),
                          title: Text("Name with initials",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Neucha',
                              )),
                          subtitle: Text(value["nameWithInitial"],
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Neucha',
                              )),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_box),
                          title: Text("Address",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Neucha',
                              )),
                          subtitle: Text(value["address"],
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Neucha',
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text("profile"),
        backgroundColor: Colors.grey[500],
      ),
      backgroundColor: Colors.grey[800],
      body: body,
      drawer: AppDrawer(value: this.value),
    );
  }
}
