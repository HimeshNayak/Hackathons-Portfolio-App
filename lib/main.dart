import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//data
import 'package:community/members.dart';

//Routes
import 'package:community/portfolioPage.dart';
import 'package:community/loginPage.dart';
import 'package:community/worksPage.dart';

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
      if (_selectedChoice.icon == Icons.account_circle)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LoginScreen(),
          ),
        );
      else if (_selectedChoice.icon == Icons.work)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                WorksDone(),
          ),
        );
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
          IconButton(
            icon: Icon(choices[1].icon),
            onPressed: () {
              _select(choices[1]);
            },
          ),
          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
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
                            padding: EdgeInsets.all(0),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item, fit: BoxFit.cover,
                                          width: double.infinity),
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
                                          name: Members.members[imgList.indexOf(item)],
                                          image: 'images/' +
                                              Members.imageMember[imgList.indexOf(
                                                  item)]),
                                ),
                              );
                            },
                          )).toList(),
                    ),
                  ),

//                1st CARD
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
                                  Icons.book,
                                  color: Colors.redAccent,
                                  size: 35.0,
                                ),
                                title: Text(
                                  'Projects',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    'Take a peek at the Projects of the members',
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
//             2nd CARD
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
                                  Icons.code,
                                  color: Colors.redAccent,
                                  size: 35.0,
                                ),
                                title: Text(
                                  'Join As a Developer',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    'Become a Ghost develper and get the opportunity to build projects',
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
//                   3rd CARD
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
                                    Icons.assignment_ind,
                                    color: Colors.redAccent,
                                    size: 35.0,
                                  ),
                                  title: Text(
                                    'Recruit Us',
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
                              _currentPage = 3;
                            });
                          }
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (int rowNo = 0, _memID = 0; rowNo < 3; rowNo++)
                    (Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int colNo = 0, num = _memID;
                        colNo < 3 && _memID < Members.members.length;
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
                                            'images/' + Members.imageMember[num],),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(Members.members[_memID]),
                                  Text(Members.membersPosition[_memID]),
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
                                            name: Members.members[num],
                                            image: 'images/' +
                                                Members.imageMember[num]),
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
            else if(_currentPage == 2)
            Center(
            child: Text('Shoe Projects'),
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

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _currentPage,
        height: 50.0,
        //Icons of the CurvedNavigationBar
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.supervised_user_circle, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
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
  const Choice(title: 'Works Done', icon: Icons.work),
  const Choice(title: 'Login', icon: Icons.account_circle),
  const Choice(title: 'Share App', icon: Icons.share),
  const Choice(title: 'Contact Developers', icon: Icons.mail),

];


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

/// This is the stateless widget that the main application instantiates.
class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[

//         Only keep the first one
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {},
              child: SizedBox(
                height: 120,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://media-exp1.licdn.com/dms/image/C5603AQHFeBYzJ48Byg/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=nvEKZjMyOi7nNS680AKc_GBXr7rB9GfKVxTHwcZXau4"),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          color: Colors.blueGrey[900],
                          child: Text(
                            "Google HashCode 2020",
                            style: TextStyle(
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),),
        Card(
          child: SizedBox(
            height: 120,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C5603AQHFeBYzJ48Byg/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=nvEKZjMyOi7nNS680AKc_GBXr7rB9GfKVxTHwcZXau4"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.blueGrey[900],
                      child: Text(
                        "Google HashCode 2020",
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Card(
          child: SizedBox(
            height: 120,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C5603AQHFeBYzJ48Byg/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=nvEKZjMyOi7nNS680AKc_GBXr7rB9GfKVxTHwcZXau4"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.blueGrey[900],
                      child: Text(
                        "Google HashCode 2020",
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Card(
          child: SizedBox(
            height: 120,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C5603AQHFeBYzJ48Byg/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=nvEKZjMyOi7nNS680AKc_GBXr7rB9GfKVxTHwcZXau4"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.blueGrey[900],
                      child: Text(
                        "Google HashCode 2020",
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}