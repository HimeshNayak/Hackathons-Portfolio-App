import 'package:flutter/material.dart';

//TODO: Collect and add the skills of the members
//Skills of the members
var skills = [
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'HTML\nCSS\nJAVAscript',
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'HTML\nCSS\nJAVAscript',
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'Android Studio\nHTML\nJavaScript\nCSS',
  'ML\nFlutter\nHTML\nCSS',
  'ML\nFlutter\nHTML\nCSS',
];

class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key key, this.title, this.memID, this.name}) : super(key: key);

  final String title;
  final int memID;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
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
      home: Portfolios(),
    );
  }
}

class Portfolios extends StatefulWidget {
  @override
  _PortfoliosState createState() => _PortfoliosState();
}

class _PortfoliosState extends State<Portfolios> {
  double h = 120;
  double w = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsNotScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Haresh Nayak",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS51EEY6JhVwuOHwpCR8ZMjJpphcYCNNayon9yeMyUb13wMTkXI&usqp=CAU",
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
                    labelColor: Colors.blueGrey[900],
                    unselectedLabelColor: Colors.blueGrey[500],
                    tabs: [
                      Tab(icon: Icon(Icons.person), text: "About"),
                      Tab(icon: Icon(Icons.book), text: "Projects"),
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
                    SizedBox(height: 20),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Linkedin : linkedin.com/in/hareshnayak08 \n\nGitHub: github.com/hareshnayak')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: h,
                                width: w,
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
                                height: h,
                                width: w,
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
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: h,
                                width: w,
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
                                height: h,
                                width: w,
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
                      height: 120,
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
                      height: 120,
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
