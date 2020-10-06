import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import './Drawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:dash_chat/dash_chat.dart';

class Chat extends StatefulWidget {
  var value;
  Chat({Key key, this.value}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<Chat> {
  // TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  // var childList = <Widget>[];
  ChatUser user = ChatUser();
  var _data;
  var _cuurentDate;
  var _currentTime;
  var _messageData;

  void sendMessage(ChatMessage message) {
    this.getDateTime();
    Firestore.instance.collection("messages").add({
      "text": message.text,
      "club_id": _data["club_id"],
      "nic": this.widget.value["nic"],
      "type": "out",
      "time": _currentTime,
      "Date": _cuurentDate,
      "userName": this.widget.value["userName"],
      "profileImage": this.widget.value["profileImage"]
    });
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
                  // user.uid = _data["club_id"].toString();
                  // print(user.uid);
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
                  // user.uid = _data["club_id"].toString();
                  // print(user.uid);
                })
              });
    }
  }

  getMessages() async {
    if (this.widget.value["role"] == 2) {
      Firestore.instance
          .collection("clubs")
          .document(this.widget.value["nic"])
          .get()
          .then((result) => {
                _messageData = Firestore.instance
                    .collection("messages")
                    .where("club_id", isEqualTo: result["club_id"])
                    .orderBy("time")
                    .snapshots()
              });
    }
    if (this.widget.value["role"] == 4) {
      _messageData = Firestore.instance
          .collection("messages")
          .where("club_id", isEqualTo: this.widget.value["club_id"]["clubId"])
          .orderBy("time")
          .snapshots();
    }
  }

  checkUser() {}

  @override
  void initState() {
    this.getClubData();
    this.getMessages();

    user.name = this.widget.value["userName"];
    user.avatar = this.widget.value["profileImage"];
    user.uid = this.widget.value["nic"];

    super.initState();
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
      body: StreamBuilder(
          stream: _messageData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              );
            } else {
              List<DocumentSnapshot> items = snapshot.data.documents;
              List<ChatMessage> messg = <ChatMessage>[];
              var _data = [];

              items.forEach((element) {
                if (this.widget.value["nic"] != element["nic"]) {
                  _data.add({
                    "text": element.data["text"],
                    "club_id": element.data["club_id"],
                    "nic": element.data["nic"],
                    "profileImage": element.data["profileImage"],
                    "Date": element.data["Date"],
                    "time": element.data["time"],
                    "type": "in",
                    "userName": element.data["userName"],
                  });
                } else {
                  _data.add({
                    "text": element.data["text"],
                    "club_id": element.data["club_id"],
                    "nic": element.data["nic"],
                    "profileImage": element.data["profileImage"],
                    "Date": element.data["Date"],
                    "time": element.data["time"],
                    "type": element.data["type"],
                    "userName": element.data["userName"],
                  });
                }
              });
              // print(_data);
              _data.forEach((res) {
                ChatMessage msg = new ChatMessage(
                  text: res["text"],
                  user: user,
                  createdAt: DateTime.now(),
                );
                messg.add(msg);
              });

              // items.forEach((res) {
              //   ChatMessage msg = new ChatMessage(
              //     text: res["text"],
              //     user: user,
              //     createdAt: DateTime.now(),
              //   );
              //   messg.add(msg);
              // });

              return DashChat(
                user: user,
                messages: messg,
                inputDecoration: InputDecoration(
                  hintText: "Enter your message...",
                  border: InputBorder.none,
                ),
                onSend: sendMessage,
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                showAvatarForEveryMessage: true,
                showUserAvatar: true,
                scrollToBottom: false,
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(),
                messageContainerDecoration: BoxDecoration(color: Colors.blue),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                trailing: <Widget>[
                  // IconButton(
                  //   icon: Icon(Icons.photo),
                  //   onPressed: uploadFile,
                  // )
                ],
              );
            }
          }),
      drawer: AppDrawer(value: widget.value),
    );
  }
}
