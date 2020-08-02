import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebPage extends StatelessWidget {
  
  var value;
  WebPage({Key key, this.value}) : super(key: key);

  static String tag = 'web-page';
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
       body: new Container(
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
       child: new RaisedButton(
       color:Colors.lightBlue,
        onPressed: _launchURL,
        child: new Text('Load CrickDom Live Streaming '),
      ),
    ),
  
      
    );
  }
} 

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);     
  } else {
    throw 'Could not launch $url';
  }
}