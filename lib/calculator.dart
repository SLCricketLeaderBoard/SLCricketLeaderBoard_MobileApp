
import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import './login.dart';
import './home.dart';

class CalculatorPage extends StatelessWidget {
  static const String routeName = '/calculator';
  var value;
  CalculatorPage({Key key, this.value}) : super(key: key);

  static String tag = 'calculator-page';
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
    
      
    
  }
}