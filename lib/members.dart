import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marquee/marquee.dart';

class Members extends StatefulWidget {
  var value;

  Members({Key key, this.value}) : super(key: key);

  @override
  _MemberViewState createState() => _MemberViewState();
}

class _MemberViewState extends State<Members> {
  final names = [];
  final profile = [];

  // var _data;
  // bool _isImage = false;

  // getClubData() async {
  //   Firestore.instance
  //       .collection("clubs")
  //       .document(this.widget.value["nic"])
  //       .get()
  //       .then((value) => {
  //             this.setState(() {
  //               _data = value.data;
  //               this.setState(() {
  //                 _isImage = true;
  //               });
  //             })
  //           });
  // }

  @override
  void initState() {
    this.getMembers();
    super.initState();
  }

  getMembers() async {
    if (this.widget.value["role"] == 2) {
      Firestore.instance
          .collection("clubs")
          .document(this.widget.value["nic"])
          .get()
          .then((result) => {
                Firestore.instance
                    .collection("users")
                    .snapshots()
                    .listen((event) {
                  event.documents.forEach((element) {
                    this.setState(() {});
                    names.add(element.data["fullName"]);
                  });
                  // print(names);
                  this.setState(() {});

                  event.documents.forEach((element) {
                    this.setState(() {});
                    profile.add(element.data["profileImage"]);
                  });
                })

                // .snapshots()
                // .listen((event){

                // })
                // print(result.data["club_id"])
                // Firestore.instance
                //     .collection("users")
                //     .where(club_id, isEqualTo: result.data["club_id"])
                //     .snapshots()
                //     .listen((event) {
                //   print(event.documents);
                // })
              });
    }
    if (this.widget.value["role"] == 4) {
      // _messageData = Firestore.instance
      //     .collection("messages")
      //     .where("club_id", isEqualTo: this.widget.value["club_id"]["clubId"])
      //     .orderBy("time")
      //     .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ruwan");
    print(names);
    print(profile);

    final card = ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profile[index]),
            ),
            title: Text(names[index]),
          ),
        );
      },
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Club Members"),
        backgroundColor: Colors.grey[500],
      ),
      backgroundColor: Colors.grey[800],
      body: card,
      drawer: AppDrawer(value: this.widget.value),
    );
  }
}
