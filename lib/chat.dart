import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import './Drawer/drawer.dart';
import './Widgets/ReceiveMessageWidget.dart';
import './Widgets/SendMessageWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  var value;
  Chat({Key key, this.value}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<Chat> {
  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];
  var _data;
  var _cuurentDate;
  var _currentTime;
  var _messageData;

  void sendMessage() {
    this.getDateTime();
    Firestore.instance.collection("messages").add({
      "text": _text.text,
      "club_id": _data["club_id"],
      "nic": this.widget.value["nic"],
      "type": "out",
      "time": _currentTime,
      "Date": _cuurentDate,
      "userName": this.widget.value["userName"],
      "profileImage": this.widget.value["profileImage"]
    });

    _text.clear();
  }

  void getDateTime() {
    var now = new DateTime.now();
    this.setState(() {
      _cuurentDate = new DateFormat("yyyy-MM-dd").format(now);
    });

    this.setState(() {
      _currentTime = new DateFormat("H:m").format(now);
    });
  }

  void getClubData() async {
    if (this.widget.value["role"] == 2) {
      Firestore.instance
          .collection("clubs")
          .document(this.widget.value["nic"])
          .get()
          .then((value) => {
                this.setState(() {
                  _data = value.data;
                })
              });
    } else if (this.widget.value["role"] == 4) {
      Firestore.instance
          .collection("clubs")
          .document(this.widget.value["club_id"]["managerId"]["userId"]["nic"])
          .get()
          .then((value) => {
                this.setState(() {
                  _data = value.data;
                })
              });
    }
  }

  void getMessages() async {
    if (this.widget.value["role"] == 2) {
      Firestore.instance
          .collection("clubs")
          .document(this.widget.value["nic"])
          .get()
          .then((result) => {
                Firestore.instance
                    .collection("messages")
                    .where("club_id", isEqualTo: result["club_id"])
                    .snapshots()
                    .listen((res) {
                  res.documents.forEach((msgs) {
                    print(msgs.data);
                  });
                })
              });
    }
    if (this.widget.value["role"] == 4) {
      Firestore.instance
          .collection("messages")
          .where("club_id", isEqualTo: this.widget.value["club_id"]["clubId"])
          .snapshots()
          .listen((res) {
        {
          res.documents.forEach((msgs) {
            print(msgs.data);
          });
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getClubData();
    this.getMessages();
    childList.add(Align(
        alignment: Alignment(0, 0),
        child: Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 25,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              )),
          child: Center(
              child: Text(
            "Today",
            style: TextStyle(fontSize: 11),
          )),
        )));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Hello',
        time: '21:36 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'How are you? What are you doing?',
        time: '21:36 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Hello,I am fine. How are you?',
        time: '22:40 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content:
            'I am good. Can you do something for me? I need your help my bro.',
        time: '22:40 PM',
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(_data["clubName"] + " " + "Chat"),
        backgroundColor: Colors.grey[500],
      ),
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // SizedBox(
                  //   height: 65,
                  //   child: Container(
                  //     color: Colors.blue.withOpacity(1),
                  //     child: Row(
                  //       children: <Widget>[
                  //         IconButton(
                  //           icon: Icon(
                  //             Icons.arrow_back,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //         ),
                  //         Spacer(),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: <Widget>[
                  //             // Text(
                  //             //   widget.username ?? "Jimi Cooke",
                  //             //   style: TextStyle(color: Colors.white, fontSize: 15),
                  //             // ),
                  //             Text(
                  //               "online",
                  //               style: TextStyle(
                  //                   color: Colors.white60, fontSize: 12),
                  //             ),
                  //           ],
                  //         ),
                  //         Spacer(),
                  //         Padding(
                  //           padding:
                  //               const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  //           child: Container(
                  //             child: ClipRRect(
                  //               child: Container(
                  //                   child: SizedBox(
                  //                       // child: Image.asset(
                  //                       //   "assets/images/person1.jpg",
                  //                       //   fit: BoxFit.cover,
                  //                       // ),
                  //                       ),
                  //                   color: Colors.orange),
                  //               borderRadius: new BorderRadius.circular(50),
                  //             ),
                  //             height: 55,
                  //             width: 55,
                  //             padding: const EdgeInsets.all(0.0),
                  //             decoration: new BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 color: Colors.white,
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Colors.black26,
                  //                       blurRadius: 5.0,
                  //                       spreadRadius: -1,
                  //                       offset: Offset(0.0, 5.0))
                  //                 ]),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    // height: 500,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //       image: AssetImage(
                      //           "assets/images/chat-background-1.jpg"),
                      //       fit: BoxFit.cover,
                      //       colorFilter: ColorFilter.linearToSrgbGamma()),
                      // ),
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: childList,
                          )),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  // SizedBox(
                  //   height: 50,
                  Container(
                    color: Colors.white,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        maxLines: 20,
                        controller: _text,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              this.sendMessage();
                            },
                          ),
                          border: InputBorder.none,
                          hintText: "enter your message",
                        ),
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(value: widget.value),
    );
  }
}
