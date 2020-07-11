import 'package:flutter/material.dart';
import 'package:crickdom/home.dart';



class Routes {
  static  String home = HomePage.routeName;
  static const String profile = '';
  static const String notes = '';
}


class AppDrawer extends StatelessWidget {
  var value;
AppDrawer({Key key, this.value}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(value: this.value,),)),),
          _createDrawerItem(icon: Icons.person, text: 'Profile',),
          _createDrawerItem(icon: Icons.chat, text: 'Chat',),
        ],
      ),
    );
  }

  Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/logo.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 14.0,
            left: 16.0,
            child: Text("SL Domestic Cricket Scorecard",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
  }

  Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
    );
  }



}
