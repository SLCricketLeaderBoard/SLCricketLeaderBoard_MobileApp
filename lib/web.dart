import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class WebPage extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
   var value;
  WebPage({Key key, this.value}) : super(key: key);

  static String tag = 'calculator-page';
  @override
  WebPageState createState() => WebPageState();

  @override
  Widget build(BuildContext context) {
    return 
    
       Scaffold(
      
        body: WebPageState(), 
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
        title: Text("LIVE STREAMING"),
        elevation: 0.0
      ),
      
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class WebPageState extends StatelessWidget {

  WebPageState({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Image.asset("assets/we1.png",width: 80.0,),                 
          const RaisedButton(
            onPressed: _launchURL_web,
            child: Text('CRICKDOM WEB LIVE UPDATES', style: TextStyle(fontSize: 20)),
          ),
        
         
          const SizedBox(height: 100),
          Image.asset("assets/yo1.png",width: 80.0,),
          
          RaisedButton(
            
            onPressed: _launchURL_tube,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('CRICKFEVER LIVE STREAMING ', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
/*
new
*/ 

  
      
 

_launchURL_tube() async {
  const url = 'https://www.youtube.com/channel/UC5ItANV2UKIt5JnKu8YLpUQ';
  if (await canLaunch(url)) {
    await launch(url);     
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL_web() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);     
  } else {
    throw 'Could not launch $url';
  }
}