import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  static const String id = 'IndexPage';

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
Widget build(BuildContext context) {
  return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //TODO: Make a header containing a banner with the logo and name
            Text('Header Image'),
            //TODO: Make a Body containing different sections like About Us, Our Aim, etc
            Text('Let\'s create a community and help each other to attain success'),
            //TODO: Footer Contains the buttons to navigate through the different sections
            Text('Footer'),
          ],
        ),
      ),
    );
  }
}