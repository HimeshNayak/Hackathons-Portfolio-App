import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title : 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  static List<String> _pages = ['Debuggers', 'Portfolios', 'Works Done', 'Join Us', 'Login'];
  String _heading = _pages[0];

  List<Widget> _pageContent = <Widget>[
    //This is the Home Page
    Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              SizedBox(
                width: 5.0,
                height: 120.0,
                child: Container(
                  color: Colors.teal[900],
                )
              ),
              SizedBox(
                width: 10.0,
                height: 120.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Let\'s Come Together as',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('DEBUGGERS',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('And Fix the Bugs in the Society',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 2.0,
            child: Container(
              color: Colors.teal[900],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Our Aim',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Something About Us and our aim',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),

        ],
      ),
    ),

  //This is the Portfolio Page
  Column(
            children: <Widget>[
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  Image.asset(
                      'images/hhlogo.png',
                      height: 100,
                      width: 100,
                  ),
                  Text('Himesh Nayak'),
                  Text('App Developer')
                ],
              ),
              Column(
                children: <Widget>[
                Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blueGrey[900]),
                  Text('Haresh Nayak'),
                  Text('App Developer')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset ('images/otherLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Parv Sharma'),
                  Text('Web Developer')
                ],
              ),
            ],
          ),
          SizedBox(
            height:10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset ('images/ipuLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Sarthak K.'),
                  Text('Web Developer')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset ('images/ipuLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Kshitij'),
                  Text('Web Developer')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset ('images/ipuLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Ankur Saini'),
                  Text('IOS Developer')
                ],
              ),
            ],
          ),
          SizedBox(
            height:10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset ('images/ipuLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Rahul Gandhi'),
                  Text('Web Developer')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset ('images/ipuLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Shubham Rawal'),
                  Text('C++ Developer')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset ('images/ipuLogo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text('Dhruv Pasricha'),
                  Text('C++ Developer')
                ],
              ),
            ],
          ),
          SizedBox(
            height:10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Column(
                  children: <Widget>[
                    Image.asset ('images/ipuLogo.png',
                      height: 100,
                      width: 100,
                    ),
                    Text('Sahil Saini'),
                    Text('Web Developer')
                  ],
                ),
                onPressed: () {

                },
              ),
            ],
          )
        ],
      ),

    //This is the Works Done Page
    Center(
      child: Column(
        children: <Widget>[
          Text('Works Done By our Team'),
          Text('Blah Blah Blah'),
        ],
      ),
    ),

    //This is the Join Us Page
    Center(
      child: Column(
        children: <Widget>[
          Text('Join Us'),
          Text('Blah Blah Blah'),
        ],
      ),
    ),

    //This is the User Page
    Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Text('User'),
            Text('Blah Blah Blah'),
          ],
        ),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$_heading',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column (
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            _pageContent[_currentPage],
          ],
        ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person_pin, size: 30, color: Colors.white),
          Icon(Icons.work, size:30, color: Colors.white),
          Icon(Icons.person_add, size:30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.blueGrey[900],
        buttonBackgroundColor: Colors.blueGrey[500],
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentPage = index;
            _heading = _pages[_currentPage];
          });
        },
      ),
    );
  }
}