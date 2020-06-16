import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO: Collect and add the skills of the members
//Skills of the members
var skills = [
  ['Android Studio', 'HTML', 'JavaScript', 'CSS'],
  ['Machine Learning', 'Flutter', 'HTML', 'CSS','Python'],
  ['HTML', 'CSS','JAVAscript', 'NodeJs'],
  ['Android Studio', 'HTML', 'JavaScript', 'CSS'],
  ['Machine Learning', 'Flutter', 'HTML', 'CSS'],
  ['HTML', 'CSS','JAVAscript', 'NodeJs'],
  ['Android Studio', 'HTML', 'JavaScript', 'CSS'],
  ['Machine Learning', 'Flutter', 'HTML', 'CSS'],
  ['HTML', 'CSS','JAVAscript', 'NodeJs'],
  ['Android Studio', 'HTML', 'JavaScript', 'CSS'],
  ['Machine Learning', 'Flutter', 'HTML', 'CSS'],
  ['HTML', 'CSS','JAVAscript', 'NodeJs'],
];

var linkedin = [
  'himeshnayak015',
  'hareshnayak08',
  'himeshnayak015',
  'hareshnayak08',
  'himeshnayak015',
  'hareshnayak08',
  'himeshnayak015',
  'hareshnayak08',
  'himeshnayak015',
  'himeshnayak015',
  'hareshnayak08',
];

var github = [
  'HimeshNayak',
  'hareshnayak',
  'HimeshNayak',
  'hareshnayak',
  'HimeshNayak',
  'hareshnayak',
  'HimeshNayak',
  'hareshnayak',
  'HimeshNayak',
  'HimeshNayak',
  'hareshnayak',
];

class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key key, this.title, this.memID, this.name, this.image}) : super(key: key);

  final String title;
  final int memID;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsNotScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.blueGrey[900],
                flexibleSpace: FlexibleSpaceBar(
                  title:
                  Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                  background: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: false,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    indicatorColor: Colors.amber[300],
                    labelColor: Colors.blueGrey[900],
                    labelPadding: EdgeInsets.all(0),
                    unselectedLabelColor: Colors.blueGrey[500],
                    tabs: [
                      Tab(icon: Icon(Icons.person), text: 'Skills'),
                      Tab(icon: Icon(Icons.book), text: 'Projects'),
                      Tab(icon:Icon(Icons.contact_mail), text: 'Contact'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: Container(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(),
                                      child: Image.network(
                                          'https://qph.fs.quoracdn.net/main-qimg-28cadbd02699c25a88e5c78d73c7babc'),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: Container(
                                  child: Center(
                                    child: Image.network(
                                        'https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png'),
                                  ),
                                  decoration:
                                  BoxDecoration(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
//                            Card(
//                              child: ListTile(
//                                      leading:

//                                      title: Text(
//                                        name,
//                                        style: TextStyle(color: Colors.black),
//                                      ),
//                                      subtitle: Text(
//                                          linkedin[memID],
//                                          style: TextStyle(color: Colors.blueGrey)),
//                                    ),
//                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: Container(
                                  child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(),
                                        child: Image.network(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWSaBULh-ALdB1N0Ho9wh2HYbkeJcwNicgZubjH83EH2atsLpu&usqp=CAU'),
                                      )),
                                  decoration:
                                  BoxDecoration(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: Container(
                                  child: Center(
                                    child: Padding(
                                      child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRIyenRe1pADpoyKK3L6V-cuNxlUodEiI0XfDB0667-waYTO2LY&usqp=CAU'),
                                      padding: EdgeInsets.symmetric(),
                                    ),
                                  ),
                                  decoration:
                                  BoxDecoration(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      //height: 120,
                      child: Card(
                        child: ListTile(
                          leading: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWSaBULh-ALdB1N0Ho9wh2HYbkeJcwNicgZubjH83EH2atsLpu&usqp=CAU'),
                          title: Text('Machine Learning'),
                          subtitle:
                          Text('Classification between a dog and a cat'),
                          trailing: FloatingActionButton(
                              child: Icon(Icons.edit),
                              backgroundColor: Colors.amber[300],
                              mini: true,
                              onPressed: () {}),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      //height: 120,
                      child: Card(
                        child: ListTile(
                          leading: Image.network(
                              'https://qph.fs.quoracdn.net/main-qimg-28cadbd02699c25a88e5c78d73c7babc'),
                          title: Text('Rock Paper Scissors'),
                          subtitle: Text('A python game'),
                          trailing: FloatingActionButton(
                              child: Icon(Icons.edit),
                              backgroundColor: Colors.amber[300],
                              mini: true,
                              onPressed: () {}),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      //height: 120,
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(
                              'images/github.png'),
                          title: Text(name),
                          subtitle:
                          Text(github[memID]),
                          trailing: FloatingActionButton(
                              child: Icon(Icons.code),
                              backgroundColor: Colors.amber[300],
                              mini: true,
                              onPressed: () {
                                String url = 'https://github.com/' + github[memID];
                                launch(url);
                              }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      //height: 120,
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(
                              'images/linkedin.png'),
                          title: Text(name),
                          subtitle: Text(linkedin[memID]),
                          trailing: FloatingActionButton(
                              child: Icon(Icons.comment),
                              backgroundColor: Colors.amber[300],
                              mini: true,
                              onPressed: () {
                                String url = 'https://linkedin.com/in/' + linkedin[memID];
                                launch(url);
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
