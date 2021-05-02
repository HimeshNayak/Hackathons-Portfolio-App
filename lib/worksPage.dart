import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksDoneApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WorksDone(),
    );
  }
}

class WorksDone extends StatefulWidget {
  @override
  _WorksDoneState createState() => _WorksDoneState();
}

class _WorksDoneState extends State<WorksDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  title: Image.asset('images/logows.png', height: 25),
                  backgroundColor: Colors.blueGrey[900]),
              SliverPersistentHeader(
                pinned: false,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey[900]),
                    labelColor: Colors.amber[300],
                    indicatorColor: Colors.amber[300],
                    unselectedLabelColor: Colors.blueGrey[500],
                    tabs: [
                      Tab(icon: Icon(Icons.supervisor_account), text: 'About'),
                      Tab(icon: Icon(Icons.work), text: 'Works Done'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  child: Container(
                    child: Center(
                      child: ListView(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset('images/logows.png', height: 80),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'TOGETHER WE BUILD',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber[200],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'TOGETHER WE GROW',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber[300],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'An initiative to bridge the gap between the recuiter and developer by serving as a portal where you can post your ideas and apply for others\' too',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey[100],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: TextButton(
                                  child: Card(
                                    color: Colors.amber[300],
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const ListTile(
                                          leading: Icon(
                                            Icons.web,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          title: Text(
                                            'Official Website',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          subtitle: Text('goDev();',
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    String url =
                                        'https://godev-community.web.app';
                                    launch(url);
                                  }),
                            ),
                          ),
                          SizedBox(height: 20),
                          Image.asset('images/hnblogo.png', height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              EventsPage(),
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

/// This is the stateless widget that the main application instantiates.
class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<List<String>> event = [
    [
      'Google Hassh Code 2020',
      '21 February, 2020',
      'Participated together as a team in Google Hash Code secured a decent rank.'
    ],
    [
      'Group Discussion on GMAFIA',
      '2 March, 2020',
      'Discussuion about the various technologies and services of GMAFIA (Google, Microsoft, Amazon, Facebook, IBM, Apple)'
    ],
    [
      'Website Launch',
      '22 June, 2020',
      'Built a website together to showcase our skills and invite others to come together and grow together.'
    ],
    [
      'App Launch',
      '23 June, 2020',
      'App app built by Himesh Nayak and Haresh Nayak to aid the communication between the developers.'
    ]
  ];

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
              onTap: () {
                _showDialogBox(context, 0);
              },
              child: SizedBox(
                height: 300,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/hashcode.jpg'),
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
                          height: 50,
                          child: Text(
                            'Google HashCode 2020',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                _showDialogBox(context, 1);
              },
              child: SizedBox(
                height: 200,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/gd.png'),
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
                          height: 50,
                          child: Text(
                            'Group Discussion on GMAFIA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                _showDialogBox(context, 2);
              },
              child: SizedBox(
                height: 170,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/website.png'),
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
                          height: 50,
                          child: Text(
                            'Website Launch',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                _showDialogBox(context, 3);
              },
              child: SizedBox(
                height: 170,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/appbanner.jpg'),
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
                          height: 50,
                          child: Text(
                            'App Launch',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDialogBox(BuildContext context, int num) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(event[num][0]),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Date : ' + event[num][1]),
                SizedBox(height: 10),
                Text(event[num][2]),
              ],
            ),
          ),
        );
      },
    );
  }
}
