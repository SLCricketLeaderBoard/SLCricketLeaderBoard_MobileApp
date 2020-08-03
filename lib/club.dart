import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Club extends StatefulWidget {
  var value;

  Club({Key key, this.value}) : super(key: key);

  @override
  _ClubViewState createState() => _ClubViewState();
}

class _ClubViewState extends State<Club> {
  getClubData() async {
    if (this.widget.value["role"] == 2) {
      Firestore.instance
          .collection("clubs")
          .document(this.widget.value["nic"])
          .get()
          .then((value) => {value.data});
    }
    // print("Ruwan");

    if (this.widget.value["role"] == 4) {}
  }

  @override
  void initState() {
    this.getClubData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(""),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        this.widget.value["userName"],
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final card = Container(
      child: Column(children: <Widget>[
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.teal[900],
            ),
            title: Text(
              this.widget.value["fullName"],
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
              this.widget.value["email"],
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
              this.widget.value["nic"],
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
              this.widget.value["address"],
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
              this.widget.value["contactNumber"],
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
              this.widget.value["regDate"],
              style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
            ),
          ),
        ),
      ]),
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
        title: new Text("Club Details"),
        backgroundColor: Colors.grey[500],
      ),
      backgroundColor: Colors.grey[800],
      body: body,
      drawer: AppDrawer(value: this.widget.value),
    );
  }
}
