import 'package:flutter/material.dart';


class Routes {
  static const String home = '';
  static const String profile = '';
  static const String notes = '';
}


class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.home,text: 'Home',),
          _createDrawerItem(icon: Icons.person, text: 'Profile',),
          _createDrawerItem(icon: Icons.event, text: 'Events',),
          // Divider(),
          // _createDrawerItem(icon: Icons.collections_bookmark, text:           'Steps'),
          // _createDrawerItem(icon: Icons.face, text: 'Authors'),
          // _createDrawerItem(icon: Icons.account_box, text: 'Flutter Documentation'),
          // _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
          // Divider(),
          // _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            // title: Text('0.0.1'),
            onTap: () {},
          ),
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
