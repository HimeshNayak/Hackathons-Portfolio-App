import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/portfolioPage.dart';

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
      home: MyHomePage(title: 'Home Page'),
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
  GlobalKey _bottomNavigationKey = GlobalKey();

  //Current Page Variable: Determines the content on the Home Page
  int _currentPage = 0;

  //Heading of the tabs given in CurvedNavigationBar in the Home Page
  static List<String> _pages = [
    'Debuggers',
    'Portfolios',
    'Works Done',
    'Join Us',
    'Login'
  ];

  //TODO: Apply firebase Realtime DB to access the names of the members
  //Name of all the members whose portfolio is displayed
  List<String> _members = [
    'Himesh Nayak',
    'Haresh Nayak',
    'Parv Sharma',
    'Sarhtak Kh.',
    'Kshitij',
    'Ankur Saini',
    'Harsh Goyal',
    'Rahul Gandhi',
    'Shubham Rawal',
    'Dhruv Pasricha',
    'Sahil Saini'
  ];

  //TODO: Apply firebase Realtime DB to access the Position/Subtext of the member
  //Position/Subtext of all the members whose portfolio is displayed
  List<String> _membersPosition = [
    'App Developer',
    'ML Enthusiast',
    'Web Developer',
    'Web Developer',
    'WebDeveloper',
    'Web Developer',
    'C++ Enthusiast',
    'Web Developer',
    'C++ Enthusiast',
    'C++ Enthusiast',
    'Web Developer'
  ];

  //TODO: Convert the images of the members from AssetImage to NetworkImage
  //TODO: Name/URL of Image files of all the members whose portfolio is displayed
  //Name of the image file for the members TEMPORARY
  String _imageMember = 'hhlogo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentPage],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),

          //TODO: Add Content to the Home page (Will Contain Images and content about the org)
          //This is the Home Content of of the Home Page
          if (_currentPage <= 0)
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
                          )),
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
                          Text(
                            'DEBUGGERS',
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'And Fix the Bugs in the Society',
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
                  Text(
                    'Something About Us and our aim',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            )

          //This is the Portfolio Content Containing image, name and subText for the members
          //The card is generated programmatically
          //TODO: Collect images of the members and display acc.ly
          else
            if (_currentPage == 1)
              Column(
                children: <Widget>[
                  for (int rowNo = 0, _memID = 0; rowNo < 6; rowNo++)
                    (Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int colNo = 0, num = _memID;
                        colNo < 3 && _memID < 11;
                        colNo++, _memID++, num = _memID)
                          (FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/$_imageMember',
                                    height: 100,
                                    width: 100,
                                  ),
                                  new Text(_members[_memID]),
                                  new Text(_membersPosition[_memID]),
                                  SizedBox(height: 5),
                                ],
                              ),

                              //Opens portfolioPage and gives passes the name and index number of the member (memID)
                              //memID will then work as an index for the skill and other things
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PortfolioPage(
                                            memID: num, name: _members[num]),
                                  ),
                                );
                              })),
                      ],
                    ))
                ],
              )

            //TODO: Add Content to Works Done Page (will contain our projects and events wew hold together)
            //This is the Works Done Page
            else
              if (_currentPage == 2)
                Center(
                  child: Column(
                    children: <Widget>[
                      Text('Works Done By our Team'),
                      Text('Blah Blah Blah'),
                    ],
                  ),
                )

              //TODO: Add Content to Join Us Page (will contain form to contact us and be part of our org)
              //This is the Join Us Page
              else
                if (_currentPage == 3)
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text('Join Us'),
                        Text('Blah Blah Blah'),
                      ],
                    ),
                  )

                //TODO: Add Content to Login Page (Will contain the profile of the user, if Logged in, else login form(firebase auth))
                //This is the user Login Page
                else
                  if (_currentPage >= 4)
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
                    )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        //Icons of the CurvedNavigationBar
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person_pin, size: 30, color: Colors.white),
          Icon(Icons.work, size: 30, color: Colors.white),
          Icon(Icons.person_add, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.blueGrey[900],
        buttonBackgroundColor: Colors.blueGrey[500],
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),

        //When an icon is pressed, index of the icon is assigned to currentPage and Page changes
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}