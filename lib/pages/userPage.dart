import 'package:flutter/material.dart';

class ConnectedUser extends StatelessWidget {
  final login;
  const ConnectedUser({this.login});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connected user'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: FutureBuilder(
          future: login,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText('id', ' ${snapshot.data['students']['id']}'),
                  customText('nom', '${snapshot.data['students']['nom']}'),
                  customText(
                      'prenom', '${snapshot.data['students']['prenom']}'),
                  customText(
                      'postnom ', '${snapshot.data['students']['postnom']}'),
                  customText('sexe', '${snapshot.data['students']['sexe']}'),
                  customText(
                      'addresse', '${snapshot.data['students']['addresse']}'),
                  customText(
                      'contact', '${snapshot.data['students']['contact']}'),
                  customText('mail', ' ${snapshot.data['students']['mail']}'),
                  customText(
                      'username', ' ${snapshot.data['students']['username']}'),
                  customText(
                      'password', '${snapshot.data['students']['password']}'),
                ],
              );
            }
            return Text('FAILED');
          },
        ),
      ),
    );
  }

  customText(key, vallue) {
    return Text(
      '$key : $vallue',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
