import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'calculator.dart';
import 'calender.dart';
import 'web.dart';
import 'review.dart';
import 'setting.dart';
import 'note.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    CalenderPage.tag: (context) => CalenderPage(),
    NotePage.tag: (context) => NotePage(),
    SettingPage.tag: (context) => SettingPage(),
    ReviewPage.tag: (context) => ReviewPage(),
    WebPage.tag: (context) => WebPage(),
    


    CalculatorPage.tag: (context) => CalculatorPage(),
    
    

    
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crick_Dom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
