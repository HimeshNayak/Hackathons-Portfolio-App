import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

//data
import 'package:community/members.dart';
import 'package:community/model/form.dart';
import 'package:community/controller/form_controller.dart';

//Routes
import 'package:community/worksPage.dart';
import 'package:community/projectsPage.dart';
import 'package:community/developers.dart';

//Imported libs
import 'package:gradient_text/gradient_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  //For all the screens in the app to be in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

//Current Page Variable: Determines the content on the Home Page
int _currentPage = 0;

//images on the featured projects
final List<String> imgList = [
  'images/chanakya.png',
  'images/mlclass.png',
  'images/heal.png',
  'images/website.png',
  'images/appbanner.jpg',
];

final List<String> imgListNames = [
  'Chanakya Website',
  'ML Classification',
  'Heal App',
  'GoDev(); Website',
  'Join Us',
];

void _gotoImageLink(int i) {
  String url;
  switch (i) {
    case 0:
      url = 'https://github.com/HimeshNayak/Chanakya';
      break;
    case 1:
      url =
          'https://www.linkedin.com/posts/hareshnayak08_tensorflowlite-flutter-dart-activity-6677613072280039424-DDI2';
      break;
    case 2:
      url =
          'https://play.google.com/store/apps/details?id=com.himeshnayak.healapp';
      break;
    case 3:
      url = 'https://godev-community.web.app';
      break;
    case 4:
      url = 'https://godev-community.web.app';
      break;
    default:
      url = 'https://godev-community.web.app';
      break;
  }
  launch(url);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'goDev();',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Home Page'),
      //),
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
    'GoDev();',
    'Developers',
    'Search Projects',
    'Join Us',
  ];
  static int _projectNo = 0;
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
      if (_selectedChoice.icon == Icons.info)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorksDone(),
          ),
        );
      else if (_selectedChoice.icon == Icons.contact_mail) {
        var url =
            'mailto:developer.godev@gmail.com?subject=Message%20to%20App%20Developer&body=Hi%20Developer,';
        launch(url);
      }
    });
  }

  void gotoProjects() {
    setState(() {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => MyProjectsPage(),
        ),
      );
    });
  }

//  final AuthService _auth = AuthService();
  int projectClicked = 0;
  int formSelected = 0;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController linksController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController ideasController = TextEditingController();
  TextEditingController projectsController = TextEditingController();

  TextEditingController searchSkill = new TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          emailController.text,
          linksController.text,
          skillsController.text,
          ideasController.text,
          projectsController.text);

      FormController formController = FormController((String response) {
        print('Response: $response');
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Response Submitted");
          print('Response Submitted');
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
          print('Error Occurred');
        }
      });

      _showSnackbar("Submitting Response");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  //form visible
  bool _gitVisible = true;
  bool _skillsVisible = true;
  bool _ideasVisible = false;
  String skillsNeededHave = 'Skills';
  bool _projectsVisible = false;

  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(Members.futurePEHead[projectClicked]),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(Members.futurePESub[projectClicked]),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: (_currentPage == 0)
            ? Image.asset(
                'images/logows.png',
                height: 25,
              )
            : GradientText(
                _pages[_currentPage],
                gradient: LinearGradient(
                  colors: [Colors.amber[300], Colors.white],
                ),
                style: TextStyle(
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
              //  await _auth.signOut();
              _select(choices[1]);
            },
          ),
          // overflow menu
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          //This is the Home Content of of the Home Page
          if (_currentPage <= 0)
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  GradientText(
                    'Featured Projects',
                    textAlign: TextAlign.left,
                    gradient: LinearGradient(
                      colors: [Colors.amber[300], Colors.white],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.amber[300],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                      items: imgList
                          .map((item) => FlatButton(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset(item,
                                              fit: BoxFit.cover,
                                              width: double.infinity),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    imgListNames[
                                                        imgList.indexOf(item)],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                onPressed: () {
                                  _projectNo = imgList.indexOf(item);
                                  print(_projectNo);

                                  if (imgList.indexOf(item) == 4) {
                                    setState(() {
                                      _currentPage = 3;
                                    });
                                  } else
                                    _gotoImageLink(imgList.indexOf(item));
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 10),
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
                                  Icons.search,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                title: Text(
                                  'Projects and Events',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    'Take a peek at the Projects and Events posted by the users.',
                                    style: TextStyle(color: Colors.black54)),
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
                                  Icons.person_add,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                title: Text(
                                  'Join As a Developer',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    'Become a GoDev developer and get the opportunity to build projects',
                                    style: TextStyle(color: Colors.black54)),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPage = 3;
                            _gitVisible = true;
                            _skillsVisible = true;
                            _ideasVisible = false;
                            skillsNeededHave = 'Skills';
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
                                    Icons.add_comment,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                  title: Text(
                                    'Recruit Us / Post an Event',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      'Share your idea or post an event and gather a team.',
                                      style: TextStyle(color: Colors.black54)),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _currentPage = 3;
                              _gitVisible = false;
                              _skillsVisible = true;
                              _ideasVisible = true;
                              skillsNeededHave = 'Skills Needed';
                            });
                          }),
                    ),
                  ),
                ],
              ),
            )
          else if (_currentPage == 1)
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: new TextField(
                    controller: searchSkill,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: new FloatingActionButton(
                        heroTag: 'btnDevelopers',
                        mini: true,
                        child: Icon(Icons.search,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.amber[300],
                        onPressed: () {
                          if (searchSkill.text == '') {
                            _showSnackbar('Enter a Skill');
                          }
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DeveloperPage(skill: searchSkill.text),
                              ),
                            );
                          }
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.amber[300],
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.amber[300],
                          width: 5.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      labelText: 'Search By Skill',
                      labelStyle: TextStyle(color: Colors.white,),
                      hintText: 'HTML, Android Studio, Machine Learning',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                for (int rowNo = 0, _memID = 0; rowNo < 4; rowNo++)
                  (new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int colNo = 0, num = _memID;
                          colNo < 3 && _memID < Members.members.length;
                          colNo++, _memID++, num = _memID)
                        (new FlatButton(
                            padding: EdgeInsets.all(0),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  width: 85,
                                  height: 85,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        image: new AssetImage(
                                          'images/' + Members.imageMember[num],
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                new SizedBox(height: 5),
                                new Text(Members.members[_memID],
                                    style: TextStyle(color: Colors.amber[300])),
                                new Text(Members.membersPosition[_memID],
                                    style: TextStyle(color: Colors.white)),
                                new SizedBox(height: 15),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => DeveloperPage(skill: Members.devSkill[num]),
                                ),
                              );
                            })),
                    ],
                  )),
              ],
            )
          else if (_currentPage == 2)
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  for (int i = 0; i < Members.futurePEHead.length; i++)
                    new Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                      child: new SizedBox(
                        child: new Card(
                          color: (Members.futurePEType[i])
                              ? Colors.white
                              : Colors.blueGrey[200],
                          shadowColor: (Members.futurePEType[i])
                              ? Colors.amber[300]
                              : Colors.amber[900],
                          child: new InkWell(
                            splashColor: Colors.amber[300],
                            onTap: () {
                              projectClicked = i;
                              _showMyDialog();
                            },
                            child: new ListTile(
                              trailing: new FloatingActionButton(
                                heroTag: 'btn$i',
                                mini: true,
                                backgroundColor: (Members.futurePEType[i])
                                    ? Colors.amber[300]
                                    : Colors.blueGrey[900],
                                onPressed: () {
                                  var url =
                                      'mailto:developer.godev@gmail.com?subject=Application%20for%20${Members.futurePEHead[i]}&body=Hi,%20I%20am%20[YOUR_NAME]%20and%20I%20have%20[YOUR_SKILLS]%20skills.';
                                  launch(url);
                                },
                                child:
                                    new Icon(Icons.mail, color: Colors.white),
                              ),
                              title: new Text(Members.futurePEHead[i]),
                              subtitle: new Text(
                                (Members.futurePEType[i])
                                    ? 'Project / Shared Idea'
                                    : 'Event',
                                style: new TextStyle(fontSize: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  new FloatingActionButton.extended(
                      heroTag: 'btnprojects',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyProjectsPage(),
                          ),
                        );
                      },
                      label: Text('View More...'),
                      icon: Icon(Icons.more),
                      backgroundColor: Colors.blueGrey[500]),
                ],
              ),
            )
          else if (_currentPage == 3)
            Center(
              child: Column(
                children: <Widget>[
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: nameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Your Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber[300],
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey[500],
                                      width: 5.0,
                                    ),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.amber[300]
                                        : Colors.white,
                                  ),
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Valid Email';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber[300],
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey[500],
                                      width: 5.0,
                                    ),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.amber[300]
                                        : Colors.white,
                                  ),
                                  hintStyle:
                                      TextStyle(color: Colors.amber[300]),
                                  hoverColor: Colors.white,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Visibility(
                                visible: _gitVisible,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: linksController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Your Github Profile Link';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.amber[300],
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey[500],
                                        width: 5.0,
                                      ),
                                    ),
                                    labelText: 'Github and Linkedin Links',
                                    labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.amber[300]
                                          : Colors.white,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.amber[300],
                                    ),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Visibility(
                                visible: _skillsVisible,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: skillsController,
                                  validator: (value) {
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.amber[300],
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey[500],
                                        width: 5.0,
                                      ),
                                    ),
                                    labelText: skillsNeededHave,
                                    labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.amber[300]
                                          : Colors.white,
                                    ),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Visibility(
                                visible: _ideasVisible,
                                child: TextFormField(
                                  focusNode: myFocusNode,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: ideasController,
                                  validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Share your Idea/Event';
                                      }
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.amber[300],
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey[500],
                                        width: 5.0,
                                      ),
                                    ),
                                    labelText: 'Share Idea / Event',
                                    labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.amber[300]
                                          : Colors.white,
                                    ),
                                    hoverColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _projectsVisible,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: projectsController,
                                  validator: (value) {
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                          color: Colors.amber[300],
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey[500],
                                          width: 5.0,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      hoverColor: Colors.white,
                                      labelText: ''),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  new FloatingActionButton.extended(
                    heroTag: 'formsubmit',
                    backgroundColor: Colors.blueGrey[500],
                    onPressed: () {
                      if (nameController.value.toString() != '' &&
                          nameController.value.toString() != '') {
                        FocusScope.of(context).unfocus(); // Close keyboard
                        setState(() {
                          //searchData = "";
                        });
                        Future.delayed(Duration(microseconds: 500), () {
                          //call back after 500  microseconds
                          nameController.clear();
                          emailController.clear();
                          linksController.clear();
                          skillsController.clear();
                          ideasController.clear();
                          projectsController.clear(); // clear textfield
                        });
                        _submitForm();
                      }
                    },
                    icon: Icon(Icons.send, color: Colors.white),
                    label: Text('Submit'),
                  ),
                ],
              ),
            ),
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
        backgroundColor: Colors.blueGrey[800],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),

        //When an icon is pressed, index of the icon is assigned to currentPage and Page changes
        onTap: (index) {
          setState(() {
            _currentPage = index;
            if (_currentPage == 3) {
              _gitVisible = true;
              _skillsVisible = true;
              _ideasVisible = false;
              skillsNeededHave = 'Skills';
            }
          });
        },
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'About', icon: Icons.info),
  const Choice(title: 'Contact Developers', icon: Icons.contact_mail),
];
