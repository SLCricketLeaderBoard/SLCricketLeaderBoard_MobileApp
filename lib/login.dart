// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:toast/toast.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String errorMessages ='';

  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  void initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter your email address';
    } else if(!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else{
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.isEmpty) {
      return 'Enter your password';
    } else {
      return null;
    }
  }

  void signIn() async {

    if(_formkey.currentState.validate()){

      Firestore.instance.collection("users")
      .where('email', isEqualTo: this.emailInputController.text)
      .where('password', isEqualTo: this.pwdInputController.text)
      .snapshots()
      .listen((res) {
        if(res.documents.length == 1){
          res.documents.forEach((doc) {
            if(doc.data["role"] == 2){
              print("Manager");
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage(value: doc.data)));

            } else if(doc.data["role"] == 3){
              print("Umpire");
              // Upire home page route
            }
         });
        }
        else {
          Toast.show(
            "Invalid Credentials",
            context, duration: Toast.LENGTH_SHORT,
            gravity:  Toast.BOTTOM,
            backgroundColor: Colors.red,
            );
        }


      });
    }
  }



  @override
  Widget build(BuildContext context) {


    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo1.png'),
      ),
    );

    final tittle = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'CrickDom',
        style: TextStyle(fontSize: 28.0, color: Colors.yellow),
        textAlign: TextAlign.center,
      ),
    );

    final subtittle = Padding(
      padding: EdgeInsets.all(5.0),
      child: Text(
        'SL Domestic Cricket Scorecard',
        style: TextStyle(fontSize: 15.0, color: Colors.yellow),
        textAlign: TextAlign.center,
      ),
    );

    final email = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: emailInputController,
      keyboardType: TextInputType.emailAddress,
      validator:emailValidator
    );

    final password = TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      autofocus: false,
      obscureText: true,
      controller: pwdInputController,
      validator: pwdValidator
    );



    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: signIn,
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            tittle,
            subtittle,
            SizedBox(height: 48.0),
            Form(
              key: _formkey,
              child: Column(

                children: <Widget>[
                  email,
                  SizedBox(height: 8.0),
                  password,

                ]

              )


            ),
            SizedBox(height: 25.0),
            loginButton,
            // forgotLabel
          ],
        ),
      ),
    );
  }
}