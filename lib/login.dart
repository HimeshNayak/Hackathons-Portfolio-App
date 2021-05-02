import 'package:flutter/material.dart';

final Color grey1 = Colors.grey.shade400;
final List<String> cat = ['#Dance', '#Music', '#theatre'];

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new NetworkImage(
                      'https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg'),
                  fit: BoxFit.fitHeight)),
          padding: EdgeInsets.all(30),
          child: Column(children: <Widget>[
            Container(
                width: 125,
                child: Column(children: <Widget>[
                  Text(
                    'goDev',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                        color: Colors.black),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '2.0',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter',
                          color: Colors.black),
                    ),
                  ),
                ])),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Inter'),
                        ),
                      ])),
            ),
          ]),
        )));
  }
}
