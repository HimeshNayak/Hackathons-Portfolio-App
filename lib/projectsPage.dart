import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Projects / Events'),
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
          title: Text(record.futurePEhead),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(record.futurePEsub),
                SizedBox(height: 10),
                Text('Posted By: ' + record.futurePEemail),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('projects').snapshots(),
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
          color: (record.futurePEtype) ? Colors.white : Colors.blueGrey[200],
          shadowColor:
              (record.futurePEtype) ? Colors.amber[300] : Colors.amber[900],
          child: InkWell(
            splashColor: Colors.amber[300],
            onTap: () {
              _showMyDialog(context, record);
            },
            child: ListTile(
              trailing: FloatingActionButton(
                mini: true,
                backgroundColor: (record.futurePEtype)
                    ? Colors.amber[300]
                    : Colors.blueGrey[900],
                onPressed: () {
                  var url =
                      'mailto:developer.godev@gmail.com?cc=${record.futurePEemail}&subject=Application%20for%20${record.futurePEhead}&body=Hi,%20I%20am%20[YOUR_NAME]%20and%20I%20have%20[YOUR_SKILLS]%20skills.';
                  launch(url);
                },
                child: Icon(Icons.mail, color: Colors.white),
              ),
              title: Text(record.futurePEhead),
              subtitle: Text(
                (record.futurePEtype) ? 'Project / Shared Idea' : 'Event',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Record {
  final bool futurePEtype;
  final String futurePEhead;
  final String futurePEsub;
  final String futurePEemail;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['futurePEtype'] != null),
        assert(map['futurePEhead'] != null),
        assert(map['futurePEsub'] != null),
        assert(map['futurePEemail'] != null),
        futurePEtype = map['futurePEtype'],
        futurePEhead = map['futurePEhead'],
        futurePEsub = map['futurePEsub'],
        futurePEemail = map['futurePEemail'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() =>
      "Record<$futurePEtype:$futurePEhead:$futurePEsub:$futurePEemail>";
}
