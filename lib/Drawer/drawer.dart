import 'package:crickdom/chat.dart';
import 'package:crickdom/members.dart';
import 'package:crickdom/profile.dart';
import 'package:crickdom/club.dart';
import 'package:flutter/material.dart';
import 'package:crickdom/home.dart';

class Routes {
  static String home = HomePage.routeName;
  static const String profile = '';
  static const String notes = '';
}

class AppDrawer extends StatelessWidget {
  var value;
  AppDrawer({Key key, this.value}) : super(key: key);

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
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    value: this.value,
                  ),
                )),
          ),
          _createDrawerItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile(
                          value: this.value,
                        ))),
          ),
          _createDrawerItem(
            icon: Icons.chat,
            text: 'Chat',
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Chat(
                          value: this.value,
                        ))),
          ),
          _createDrawerItem(
            icon: Icons.account_box,
            text: 'Club ',
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Club(
                          value: this.value,
                        ))),
          ),
          _createDrawerItem(
            icon: Icons.group,
            text: 'Club Members',
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Members(
                          value: this.value,
                        ))),
          )
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
                fit: BoxFit.fill, image: AssetImage('assets/lol.png'))),
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
