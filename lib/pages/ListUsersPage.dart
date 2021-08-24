import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/EditPage.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  Dio _dio = Dio();
  List studentsList = [];

  @override
  void initState() {
    getStudents();
    super.initState();
  }

  getStudents() async {
    try {
      var response = await _dio.get('http://192.168.137.1:3535/students/all');
      return response.data;
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text('L2 Ig'),
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: FutureBuilder(
          future: getStudents(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(snapshot.data['students'][index]['nom']),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(),
                              ));
                        },
                        child: Container(
                          height: 50,
                          width: 60,
                          color: Colors.green,
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data['students'].length,
            );
          },
        ),
      ),
    );
  }
}
