import 'package:flutter/material.dart';

final Color grey1 = Colors.grey.shade400;

List<String> mentor = ['Haresh', 'Himesh', 'Pratyush', 'Priyanka', 'Abhiraj'];
List<String> _category = [
  'Frontend WebD',
  'Backend WebD',
  'App Development',
  'Competitive Coding',
  'Software'
];
final List<String> arrived = [
  'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg',
  'https://cdn.pixabay.com/photo/2016/10/21/14/50/plouzane-1758197__340.jpg',
  'https://cdn.pixabay.com/photo/2013/08/20/15/47/sunset-174276__340.jpg',
  'https://cdn.pixabay.com/photo/2013/07/18/10/56/railroad-tracks-163518__340.jpg',
  'https://cdn.pixabay.com/photo/2013/11/28/10/36/road-220058__340.jpg'
];
List<String> _subCatFW = ['HTML', 'JavaScript', 'CSS'];

final List<String> _subCatImage = [
  'https://cdn.pixabay.com/photo/2017/08/05/11/16/logo-2582748_960_720.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQnp_Te-3vrTnE8OdMw3b9Kb5Bay7Qj--aJcw&usqp=CAU',
  'https://kariselovuo.pro/ksprov1/wp-content/uploads/2018/02/css-logo.png',
];

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
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
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Icon(Icons.home, color: Colors.black),
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
        body: ListView(
          children: <Widget>[
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.4), width: 1.0),
                    color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          enabledBorder: new UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        print("your menu action here");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Mentors',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
//                       if (login == false)
//                         showDialog(
//                           context: context,
//                           builder: (_) => Login(),
//                         );
                    },
                    child: Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
//                   margin: EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 150,
                    child: Stack(
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Container(
                            color: grey1,
                            height: 150,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(),
                              ),
                              child: Image.network('${arrived[index]}',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 150,
                            height: 60,
                            padding: EdgeInsets.all(0),
                            color: Colors.black26,
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: ListTile(
                                title: Text(
                                  '${mentor[index]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  '${_category[index]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              itemCount: 5,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int k) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '${_category[k]}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 40,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                              onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context )=> NavDrawer()));
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 80,
                              width: 100,
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AcademyPage()));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        '${_subCatImage[index]}',
                                      ),
                                    ),
                                    Text('${_subCatFW[index]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
