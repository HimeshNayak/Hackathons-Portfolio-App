import 'package:flutter/material.dart';

final Color grey1 = Colors.grey.shade400;

class NewUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(Icons.cloud, color: Colors.black),
//             SizedBox(
//                   width: 60,
//                 height: 30,
//                   child: FlatButton(
//                 padding: EdgeInsets.all(0),
//                       onPressed: () {},
//                       child: Icon(Icons.search, color: Colors.black))),
            title: Center(
              child: Text(
                'GoDev',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            elevation: 0,
            actions: <Widget>[
              SizedBox(
                width: 60,
                height: 30,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: Icon(Icons.edit), mini: true),
        body: ProfilePage(),
      ),
    );
  }
}

final String name = 'Haresh ';
final String email = 'haresh@gmail.com';
final String github = 'hareshnayak';
final String linkedin = 'hareshnayak08';
final List<String> skills = ['Flutter', 'Android', 'ML'];

final List<String> postImg = [
  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
  'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569__340.jpg',
  'https://cdn.pixabay.com/photo/2015/03/17/14/05/sparkler-677774__340.jpg',
  'https://cdn.pixabay.com/photo/2017/12/10/20/56/feather-3010848__340.jpg',
  'https://cdn.pixabay.com/photo/2016/11/14/04/45/elephant-1822636__340.jpg'
];
final List<String> arrived = [
  'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg',
  'https://cdn.pixabay.com/photo/2016/10/21/14/50/plouzane-1758197__340.jpg',
  'https://cdn.pixabay.com/photo/2013/08/20/15/47/sunset-174276__340.jpg',
  'https://cdn.pixabay.com/photo/2013/07/18/10/56/railroad-tracks-163518__340.jpg',
  'https://cdn.pixabay.com/photo/2013/11/28/10/36/road-220058__340.jpg'
];

final List<String> teamMem = ['Haresh', 'Himesh', 'Aadish', 'Apoorva', 'Adhya'];

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
//       padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          Container(
            height: 120,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 51,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBUXESNi9dDwsxnZoDpAktF-piO2mU778bEQ&usqp=CAU',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Haresh Nayak',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Flutter Developer'),
                    SizedBox(height: 10),
                    Text('Never Stop Learning',
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ],
                )
              ],
            ),
          ),
          Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: grey1),
          DefaultTabController(
            length: 4,
            child: Container(
              height: 350.0,
              child: Column(
                children: <Widget>[
                  TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Icon(Icons.book, color: Colors.grey.shade700),
                      ),
                      Tab(
                        child: Icon(Icons.code, color: Colors.grey.shade700),
                      ),
                      Tab(
                        child: Icon(Icons.link, color: Colors.grey.shade700),
                      ),
                      Tab(
                        child: Icon(Icons.image, color: Colors.grey.shade700),
                      ),
//                         Tab(
//                        child: Text("Skills",style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold,),),
//                       ),
//                       Tab(
//                          child: Text("Links",style: TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.bold,),),
//                       ),
//                         Tab(
//                          child: Text("Posts",style: TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.bold,),),
//                       ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(2),
                                  child: SizedBox(
                                    //height: 120,
                                    child: Card(
                                      child: ListTile(
                                        leading:
                                            Image.asset('images/gmail.png'),
                                        title: Text(email),
                                        subtitle: Text('Email Address'),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(2),
                                  child: SizedBox(
                                    //height: 120,
                                    child: Card(
                                      child: ListTile(
                                        leading:
                                            Image.asset('images/gmail.png'),
                                        title: Text(email),
                                        subtitle: Text('Email Address'),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(2),
                                child: SizedBox(
                                  //height: 120,
                                  child: Card(
                                    child: ListTile(
                                      leading: Image.asset('images/gmail.png'),
                                      title: Text(email),
                                      subtitle: Text('Email Address'),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
//                   margin: EdgeInsets.symmetric(vertical: 10),
                          height: 200,
                          child: ListView.builder(
                            itemCount: 5,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                child: Stack(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    color: grey1,
                                    height: 350,
                                    child: Image.network('${postImg[i]}',
                                        fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                    top: 260.0,
                                    left: 0.0,
                                    right: 0.0,
//                 child: Center(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      color: Colors.black26,
//                     height: MediaQuery.of(context).size.height,
                                      height: 100,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                        ),
                                        onPressed: () {},
                                        child: Column(
                                          children: <Widget>[
//                             Container(height: 2, color: Colors.white70),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                'Urban Living',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                'In today\'s world it is really important to be ...',
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
//                 ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      height: 50,
//                     width: 250,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade900,
                                                offset:
                                                    Offset(0.0, 3.0), //(x,y)
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                width: 1.0),
                                            color: Colors.white),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
//                           SizedBox(width: 20),
                                            SizedBox(
                                              width: 50,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.all(0),
                                                ),
                                                onPressed: () {},
                                                child: Icon(Icons.thumb_up,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.all(0),
                                                ),
                                                onPressed: () {},
                                                child: Icon(Icons.comment,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.all(0),
                                                ),
                                                onPressed: () {},
                                                child: Icon(Icons.share,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class PostTemp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => PostTempState();
// }

// class PostTempState extends State<PostTemp> with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 450));
//     scaleAnimation =
//         CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

//     controller.addListener(() {
//       setState(() {});
//     });

//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//    return Center(
//       child: Material(
//         color: Colors.transparent,
//         child: ScaleTransition(
//           scale: scaleAnimation,
//           child: Container(
//               margin: EdgeInsets.all(20.0),
//               padding: EdgeInsets.fromLTRB(5,20,5,10),
//               height: 450.0,
//               decoration: ShapeDecoration(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0))),
//               child: Column(children: <Widget>[
//                  Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'Templates',
//                       style: TextStyle(
//                           fontSize: 20.0, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                  Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               height: 370,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 5,
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     width: 220,
//                     height: 370,
//                     child: Column(
//                     children: <Widget>[
//                       Container(
//                         height: 300,
//                         child: Image.network('${postImg[index]}', fit: BoxFit.cover),),
//                 Padding(
//                       padding: EdgeInsets.only(top: 10),
//                       child: FloatingActionButton.extended(
//                         backgroundColor: Colors.grey.shade300,
//                         label: Text(
//                           'Use Image',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onPressed: () {
//                           setState((){
//                            temp = true;
//                             tempImg = index;
//                             print(temp);
//                             print(tempImg);
//                           });
//                         },
//                         icon: Icon(Icons.image, color: Colors.black),
//                       ),
//                     ),

//                     ]),
//                   );
//                 },
//               )),])),
//         ),
//       ),
//     );
//   }
// }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  final List<String> teamMem = [
    'Haresh',
    'Himesh',
    'Aadish',
    'Apoorva',
    'Adhya'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
            height: 400.0,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Team Name',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                for (int k = 0; k < 4; k++)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(''),
                        title: Text(
                          '${teamMem[k]}',
                          style: TextStyle(fontWeight: FontWeight.bold),
//                                    subtitle: Text('')
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
