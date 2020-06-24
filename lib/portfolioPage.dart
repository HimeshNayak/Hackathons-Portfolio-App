import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:community/members.dart';

//TODO: Collect and add the skills of the members
//Skills of the members

class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key key, this.title, this.memID, this.name, this.image})
      : super(key: key);

  final String title;
  final int memID;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
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
                  title: Text(
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
//                       padding: EdgeInsets,all(10),
                          width: double.infinity,
                          child: Icon(Icons.book),
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
                child: OverflowBox(
                  maxHeight: double.infinity,
                  child:
                      //_buildBody(context),
                      Column(
                    children: <Widget>[
                      for (int i = 0; i < Members.skills[memID].length; i++)
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              30,
                              (i == 0 && Members.skills[memID].length > 2)
                                  ? 50
                                  : 10,
                              30,
                              10),
                          child: SizedBox(
                            //height: 120,
                            child: Card(
                              shadowColor: Colors.amber[300],
                              child: ListTile(
                                leading:
                                    Icon(Icons.star, color: Colors.amber[300]),
                                title: Text(Members.skillsHead[memID][i]),
                                subtitle: Text(Members.skills[memID][i]),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Center(
                child: OverflowBox(
                  maxHeight: double.infinity,
                  child: Column(
                    children: <Widget>[
                      for (int j = 0;
                          j < Members.projectsHead[memID].length;
                          j++)
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              10, (j == 0) ? 50 : 10, 10, 10),
                          child: SizedBox(
                            //height: 120,
                            child: Card(
                              shadowColor: Colors.amber[300],
                              child: ListTile(
                                leading: (Members.projectUrl[memID][j] == '')
                                    ? SizedBox(width: 2, height: 2)
                                    : FloatingActionButton(
                                        backgroundColor: Colors.amber[300],
                                        mini: true,
                                        child: Icon(Icons.visibility),
                                        onPressed: () {
                                          var url =
                                              Members.projectUrl[memID][j];
                                          launch(url);
                                        },
                                      ),
                                title: Text(Members.projectsHead[memID][j]),
                                subtitle: Text(Members.projectsSub[memID][j]),
                                trailing: (Members.projectCode[memID][j] == '')
                                    ? SizedBox(width: 2, height: 2)
                                    : FloatingActionButton(
                                        child: Icon(Icons.code),
                                        backgroundColor: Colors.amber[300],
                                        mini: true,
                                        onPressed: () {
                                          var url =
                                              Members.projectCode[memID][j];
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
              Center(
                child: OverflowBox(
                  maxHeight: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          //height: 120,
                          child: Card(
                            shadowColor: Colors.amber[300],
                            child: ListTile(
                              leading: Image.asset('images/github.png'),
                              title: Text(Members.github[memID]),
                              subtitle: Text('Github Profile'),
                              trailing: FloatingActionButton(
                                  child: Icon(Icons.code),
                                  backgroundColor: Colors.amber[300],
                                  mini: true,
                                  onPressed: () {
                                    String url = 'https://github.com/' +
                                        Members.github[memID];
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
                              leading: Image.asset('images/linkedin.png'),
                              title: Text(Members.linkedin[memID]),
                              subtitle: Text('Linkedin Profile'),
                              trailing: FloatingActionButton(
                                  child: Icon(Icons.comment),
                                  backgroundColor: Colors.amber[300],
                                  mini: true,
                                  onPressed: () {
                                    if (Members.linkedin[memID] != 'N/A') {
                                      String url = 'https://linkedin.com/in/' +
                                          Members.linkedin[memID];
                                      launch(url);
                                    }
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
                              title: Text(Members.email[memID]),
                              subtitle: Text('Email Address'),
                              trailing: FloatingActionButton(
                                  child: Icon(Icons.mail),
                                  backgroundColor: Colors.amber[300],
                                  mini: true,
                                  onPressed: () {
                                    var url =
                                        'mailto:${Members.email[memID]}@gmail.com?subject=Message%20through%20App&body=Hi,%20$name';
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
