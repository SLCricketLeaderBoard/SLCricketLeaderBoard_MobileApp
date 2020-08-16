
import 'package:flutter/material.dart';
import './Drawer/drawer.dart';
import './login.dart';
import './home.dart';
import "package:flutter/material.dart";
import "dart:math";



  class  CalculatorPage extends StatefulWidget {
  static const String routeName = '/calculator';
  var value;
  CalculatorPage({Key key, this.value}) : super(key: key);

  static String tag = 'calculator-page';
  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {

  List _tenureTypes = [ 'Month(s)', 'Year(s)' ];
  String _tenureType = "Year(s)";
  String _emiResult = "";

  final TextEditingController _total1 = TextEditingController();
  final TextEditingController _wickets1 = TextEditingController();
  final TextEditingController _overs1 = TextEditingController();
  final TextEditingController _overs2 = TextEditingController();

  bool _switchValue = true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DL Calculator"),
        elevation: 0.0
      ),

      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: _total1,
                  decoration: InputDecoration(
                    labelText: "Enter Team 1 Runs"
                  ),
                  keyboardType: TextInputType.number,

                )
              ),

              Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: _wickets1,
                  decoration: InputDecoration(
                    labelText: "Wickets Team 1"
                  ),
                  keyboardType: TextInputType.number,
                )
              ),

              Container(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: TextField(
                        controller: _overs1,
                        decoration: InputDecoration(
                          labelText: " Total overs Team 1"
                        ),
                        keyboardType: TextInputType.number,
                      )
                    ),

                    
                  ],
                )
                
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: TextField(
                        controller: _overs2,
                        decoration: InputDecoration(
                          labelText: "Team 2 Left Overs"
                        ),
                        keyboardType: TextInputType.number,
                      )
                    ),

                    
                  ],
                )
                
              ),
              

              Flexible(
                fit: FlexFit.loose,
                child: FlatButton(
                  onPressed: _handleCalculation,
                  child: Text("Calculate"),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0)
                )
              ),

              emiResultsWidget(_emiResult)
              
            ],
          )
        )
      )
    );
  }

  void _handleCalculation() {

    //  Amortization
    //  A = Payemtn amount per period
    //  P = Initial Printical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    double A = 0.0;
    int P = int.parse(_total1.text); 
    double r = int.parse(_wickets1.text) / 1 ;
    int n1 = int.parse(_overs1.text); 
    int n2 = int.parse(_overs1.text);

    A = (P /n1 +((50-n1)*0.01*(10-r)))*n2 ;
    
    _emiResult = A.toStringAsFixed(2);

    setState(() {

    });
  }


  Widget emiResultsWidget(emiResult) {

    bool canShow = false;
    String _emiResult = emiResult;

    if( _emiResult.length > 0 ) {
      canShow = true;
    }
    return
    Container(
      margin: EdgeInsets.only(top: 40.0),
      child: canShow ? Column(
        children: [
          Text("Estimated Target is  ",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            )
          ),
          Container(
            child: Text(_emiResult,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold
            ))
          )  
        ]
      ) : Container()
    );

    
  }
}