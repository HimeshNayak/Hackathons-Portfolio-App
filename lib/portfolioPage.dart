import 'package:flutter/material.dart';


var skills = [
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'HTML\nCSS\nJAVAscript',
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'HTML\nCSS\nJAVAscript',
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'ML\nFlutter\nHTML\nCSS',
];


class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key key, this.title, this.memID, this.name}) : super(key: key);

  final String title;
  final int memID;
  final String name;

  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title:Text(name), backgroundColor: Colors.blueGrey[900],),
      body: Center(
        child: Column(
          children: [
            Text('Here is the Portfolio of $name',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
            Text('Skills are : ' + skills[memID],
              style: TextStyle(
                  fontSize: 20.0
              ),
            ),
            RaisedButton(
              child: Text('Go Back to other Profiles'),
                // Within the SecondRoute widget
                onPressed: () {
                  Navigator.pop(context);
                }

            ),
          ],
        ),

      ),
    );
  }
}