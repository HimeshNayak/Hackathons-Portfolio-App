import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/loginPage.dart';

//Routes
import 'package:portfolio/portfolioPage.dart';

//Imported libs
import 'package:gradient_text/gradient_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//Current Page Variable: Determines the content on the Home Page
int _currentPage = 0;

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

void main() {
//  SystemChrome.setSystemUIOverlayStyle(
//    SystemUiOverlayStyle(
//      systemNavigationBarColor:
//      SystemUiOverlayStyle.dark.systemNavigationBarColor,
//    ),
//  );
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
      debugShowCheckedModeBanner: false,
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

  //Heading of the tabs given in CurvedNavigationBar in the Home Page
  static List<String> _pages = [
    'GHOSTS',
    'Portfolios',
    'Works Done',
    'Join Us',
  ];

  //TODO: Apply firebase Realtime DB to access the names of the members
  //Name of all the members whose portfolio is displayed
  List<String> _members = [
    'Himesh Nayak',
    'Haresh Nayak',
    'Parv Sharma',
    'Sarhtak Kh.',
    'Kshitij Garg',
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
  List<String> _imageMember = [
    'himesh.jpg',
    'haresh.jpg',
    'hhlogo.png',
    'sarthak.png',
    'hhlogo.png',
    'hhlogo.png',
    'hhlogo.png',
    'hhlogo.png',
    'hhlogo.png',
    'hhlogo.png',
    'hhlogo.png',
  ];

  String _joinName, _joinEmail;
  final _formKey = new GlobalKey<FormState>();
  static int _projectNo = 0;

  void validateFormAndPushData() {
    final form = _formKey.currentState;
    if (form.validate())
      print('Form Submmitted Name = $_joinName and Email = $_joinEmail');
    else
      print('Some Issue is there');
  }

  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
      if (_selectedChoice.icon == Icons.person)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LoginScreen(),
          ),
        );
      else if (_selectedChoice.icon == Icons.search)
        _currentPage = 2;
      else if (_selectedChoice.icon == Icons.share)
        _currentPage = 1;
      else if (_selectedChoice.icon == Icons.mail)
        _currentPage = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          _pages[_currentPage],
          gradient: LinearGradient(
            colors: [Colors.amber[300], Colors.white],
          ), style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.blueGrey[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ),
          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(1).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Row(
                    children: [
                      Icon(choice.icon, color: Colors.blueGrey[900],),
                      SizedBox(width: 10),
                      Text(choice.title),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
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
                  SizedBox(
                    height: 10.0,
                  ),
                  GradientText('Featured Projects',
                    textAlign: TextAlign.left,
                    gradient: LinearGradient(
                      colors: [Colors.blueGrey[900], Colors.grey[500]],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.amber[300],
                    ),
                  ),
                  Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 2,
                        autoPlay: true,
                      ),
                      items: imgList.map((item) =>

                          FlatButton(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item, fit: BoxFit.cover,
                                          width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(200, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: Row(children: <Widget>[
                                            Text(
                                              'No. ${imgList.indexOf(
                                                  item)} image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            onPressed: () {
                              _projectNo = imgList.indexOf(item);
                              print(_projectNo);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PortfolioPage(
                                          memID: imgList.indexOf(item),
                                          name: _members[imgList.indexOf(item)],
                                          image: 'images/' +
                                              _imageMember[imgList.indexOf(
                                                  item)]),
                                ),
                              );
                            },
                          )).toList(),
                    ),
                  ),

//                1nd CARD
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: FlatButton(
                        child: Card(
                          color: Colors.amber[300],
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(
                                  Icons.create,
                                  color: Colors.redAccent,
                                  size: 35.0,
                                ),
                                title: Text(
                                  'Apply',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    'Apply for collaborating on your peers projects',
                                    style: TextStyle(color: Colors.blueGrey)),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPage = 3;
                          });
                        },
                      ),
                    ),
                  ),
//             3rd CARD
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: FlatButton(
                        child: Card(
                          color: Colors.amber[300],
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(
                                  Icons.touch_app,
                                  color: Colors.redAccent,
                                  size: 35.0,
                                ),
                                title: Text(
                                  'Share Idea',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    'Share your idea and pick developers to work on your project',
                                    style: TextStyle(color: Colors.blueGrey)),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPage = 2;
                          });
                        },
                      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/' + _imageMember[num],),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(_members[_memID]),
                                  Text(_membersPosition[_memID]),
                                  SizedBox(height: 15),
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
                                            memID: num,
                                            name: _members[num],
                                            image: 'images/' +
                                                _imageMember[num]),
                                  ),
                                );
                              })),
                      ],
                    )
                    )
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
                    child: new Form(
                      key: _formKey,
                      child: new Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Name';
                                }
                                return null;
                              },
                              onSaved: (value) => _joinName = value,
                            ),
                            new TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                              onSaved: (value) => _joinEmail = value,
                            ),
                            new Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0),
                              child: new RaisedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                    validateFormAndPushData();
                                  }
                                },
                                child: new Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                color: Colors.amber[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

          //TODO: Add Content to Login Page (Will contain the profile of the user, if Logged in, else login form(firebase auth))
          //This is the user Login Page
//                else
//                  if (_currentPage >= 4)
//                    Container(
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.stretch,
//                        children: <Widget>[
//                          SizedBox(
//                            width: 10.0,
//                          ),
//                          Text('User'),
//                          Text('Blah Blah Blah'),
//                        ],
//                      ),
//                    )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _currentPage,
        height: 50.0,
        //Icons of the CurvedNavigationBar
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person_pin, size: 30, color: Colors.white),
          Icon(Icons.work, size: 30, color: Colors.white),
          Icon(Icons.person_add, size: 30, color: Colors.white),
        ],
        color: Colors.blueGrey[900],
        buttonBackgroundColor: Colors.amber[300],
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),

        //When an icon is pressed, index of the icon is assigned to currentPage and Page changes
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      )
      ,
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Login', icon: Icons.person),
  const Choice(title: 'Search Projects', icon: Icons.search),
  const Choice(title: 'Share App', icon: Icons.share),
  const Choice(title: 'Contact Developers', icon: Icons.mail),

];