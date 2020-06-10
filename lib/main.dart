import 'package:flutter/material.dart';
import 'package:worktogether/screens/IndexPage.dart';
import 'package:worktogether/screens/PortfolioPage.dart';
import 'package:worktogether/screens/WorksDonePage.dart';
import 'package:worktogether/screens/JoinUsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IndexPage.id,
      routes: {
        IndexPage.id : (context) => IndexPage(),
        PortfolioPage.id : (context) => PortfolioPage(),
        WorksDonePage.id : (context) => WorksDonePage(),
        JoinUsPage.id : (context) => JoinUsPage(),
      },
    );
  }
}
