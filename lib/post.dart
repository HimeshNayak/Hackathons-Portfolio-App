import 'package:flutter/material.dart';

final Color grey1 = Colors.grey.shade400;

class NewUIPost extends StatelessWidget {
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
                      child: Icon(Icons.search, color: Colors.black)))
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
        body: PostPage(),
      ),
    );
  }
}

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

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
//   bool login = true;

  Widget postImage(int i) {
    if (temp == false)
      return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//                     Center(
//                       child: IconButton(
//                           icon: Icon(Icons.add, color: Colors.black, size: 40),
//                           onPressed: () {}),
//                     ),
//                     SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.grey.shade300,
                label: Text(
                  'Insert Image',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.add, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.grey.shade300,
                label: Text(
                  'Use Template Image',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  print(temp);
                  showDialog(
                    context: context,
                    builder: (_) => PostTemp(),
                  );
                },
                icon: Icon(Icons.image, color: Colors.black),
              ),
            ),
          ]);
    else if (temp == true)
      return Image.network('${postImg[tempImg]}', fit: BoxFit.cover);

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//       padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          Text('Post',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 300,
                width: 250,
                color: grey1,
                child: postImage(tempImg)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: grey1,
                ),
                onPressed: () {},
                child: Text('Submit'),
              ),
            ),
          ])
//             TextField(maxLines: 4, decoration: InputDecoration(hintText: 'Description',),),
        ],
      ),
    );
  }
}

int tempImg = 0;
bool temp = false;
var selectedImg = postImg[0];

class PostTemp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostTempState();
}

class PostTempState extends State<PostTemp>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              height: 450.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Templates',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 370,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 220,
                          height: 370,
                          child: Column(children: <Widget>[
                            Container(
                              height: 300,
                              child: Image.network('${postImg[index]}',
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: FloatingActionButton.extended(
                                backgroundColor: Colors.grey.shade300,
                                label: Text(
                                  'Use Image',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    temp = true;
                                    tempImg = index;
                                    print(temp);
                                    print(tempImg);
                                  });
                                },
                                icon: Icon(Icons.image, color: Colors.black),
                              ),
                            ),
                          ]),
                        );
                      },
                    )),
              ])),
        ),
      ),
    );
  }
}

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
                      borderRadius: BorderRadius.circular(15.0))),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Team Name',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
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
                            )),
                      ),
                    ),
                ],
              )),
        ),
      ),
    );
  }
}
