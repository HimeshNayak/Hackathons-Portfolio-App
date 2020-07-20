import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage(
      {Key key, this.email, this.name, this.github, this.linkedin, this.skills})
      : super(key: key);

  final String name;
  final String email;
  final String github;
  final String linkedin;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsNotScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.blueGrey[900],
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16.0,
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
                    labelColor: Colors.amber[300],
                    unselectedLabelColor: Colors.blueGrey[500],
                    tabs: [
                      Tab(
                        child: Container(
                          height: double.infinity,
//                       padding: EdgeInsets,all(10),
                          width: double.infinity,
                          child: Icon(Icons.code),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: double.infinity,
                          //padding: EdgeInsets,all(10),
                          width: double.infinity,
                          child: Icon(Icons.contact_mail),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Center(
                child: ListView(
                  children: [
                    for (int i = 0; i < skills.length;)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (i < skills.length)
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10.0),
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.amber[300]),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Text(
                                skills[i++],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          if (i < skills.length)
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(10.0),
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.amber[300]),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                              ),
                              child: Text(
                                skills[i++],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
              Center(
                child: OverflowBox(
                  maxHeight: double.infinity,
                  child: Column(
                    children: <Widget>[
                      if (github != 'https://github.com')
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            //height: 120,
                            child: Card(
                              shadowColor: Colors.amber[300],
                              child: ListTile(
                                leading: Image.asset('images/github.png'),
                                title: Text(github),
                                subtitle: Text('Github Profile'),
                                trailing: FloatingActionButton(
                                    heroTag: 'gitbtn',
                                    child: Icon(Icons.code),
                                    backgroundColor: Colors.amber[300],
                                    mini: true,
                                    onPressed: () {
                                      String url = github;
                                      launch(url);
                                    }),
                              ),
                            ),
                          ),
                        ),
                      if (linkedin != 'https://linkedin.com')
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            //height: 120,
                            child: Card(
                              child: ListTile(
                                leading: Image.asset('images/linkedin.png'),
                                title: Text(linkedin),
                                subtitle: Text('Linkedin Profile'),
                                trailing: FloatingActionButton(
                                    heroTag: 'linkedinbtn',
                                    child: Icon(Icons.comment),
                                    backgroundColor: Colors.amber[300],
                                    mini: true,
                                    onPressed: () {
                                      String url = linkedin;
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
                              leading: Image.asset('images/gmail.png'),
                              title: Text(email),
                              subtitle: Text('Email Address'),
                              trailing: FloatingActionButton(
                                  heroTag: 'emailbtn',
                                  child: Icon(Icons.mail),
                                  backgroundColor: Colors.amber[300],
                                  mini: true,
                                  onPressed: () {
                                    var url =
                                        'mailto:$email@gmail.com?subject=Message%20through%20App&body=Hi,%20$name';
                                    launch(url);
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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