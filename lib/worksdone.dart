import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
//               SliverAppBar(
//                 expandedHeight: 300.0,
//                 floating: false,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                   title: Text(
//                     "Haresh Nayak",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                   background: Image.network(
//                     "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS51EEY6JhVwuOHwpCR8ZMjJpphcYCNNayon9yeMyUb13wMTkXI&usqp=CAU",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
              SliverAppBar(
                  title: Text('Work Done'),
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
                      Tab(icon: Icon(Icons.person), text: 'Events'),
                      Tab(icon: Icon(Icons.book), text: 'Projects'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              EventsPage(),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  child: Container(
                    child: Center(
                      child: Text('Machine Learning'),
                    ),
//                           decoration: BoxDecoration(color: Colors.amber[300]),
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
          padding: EdgeInsets.fromLTRB(0,10,0,10),
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
