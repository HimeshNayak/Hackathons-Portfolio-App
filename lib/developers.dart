import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:community/portfolioPage.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({this.skill});

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(skill),
      ),
      body: _buildBody(context),
    );
  }

  Future<void> _showMyDialog(BuildContext context, Record record) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(record.name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Skills :',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                for (int i = 0; i < record.skills.length; i++)
                  Text(record.skills[i], textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <IconButton>[
                    IconButton(
                      icon: Image.asset(
                        'images/github.png',
                        height: 30,
                      ),
                      onPressed: () {
                        var url = record.github;
                        launch(url);
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'images/linkedin.png',
                        height: 30,
                      ),
                      onPressed: () {
                        var url = record.linkedin;
                        launch(url);
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'images/gmail.png',
                        height: 30,
                      ),
                      onPressed: () {
                        var url =
                            'mailto:developer.godev@gmail.com?cc=${record.email}&subject=Message%20from%20GoDev&body=Hi,%20${record.name}';
                        launch(url);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('members')
          .where("skills", arrayContainsAny: [skill]).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: SizedBox(
        child: Card(
          color: Colors.white,
          shadowColor: Colors.amber[300],
          child: InkWell(
            splashColor: Colors.amber[300],
            onTap: () {
              //_showMyDialog(context, record);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PortfolioPage(
                      email: record.email,
                      name: record.name,
                      github: record.github,
                      linkedin: record.linkedin,
                      skills: record.skills),
                ),
              );
              print(record.documentID);
            },
            child: ListTile(
              trailing: FloatingActionButton(
                heroTag: 'mailbtn${record.documentID}',
                mini: true,
                backgroundColor: Colors.amber[300],
                onPressed: () {
                  var url =
                      'mailto:developer.godev@gmail.com?cc=${record.email}&subject=Message%20from%20GoDev&body=Hi,%20${record.name}';
                  launch(url);
                },
                child: Icon(Icons.mail, color: Colors.white),
              ),
              title: Text(record.name),
              subtitle: Text('..., $skill, ...',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}

class Record {
  final String documentID;
  final String name;
  final List<String> skills;
  final String email;
  final String github;
  final String linkedin;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['skills'] != null),
        assert(map['email'] != null),
        assert(map['github'] != null),
        assert(map['linkedin'] != null),
        name = map['name'],
        email = map['email'],
        skills = List.from(map['skills']),
        github = map['github'],
        linkedin = map['linkedin'],
        documentID = reference.documentID;

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$skills:$email:$github:$linkedin>";
}
