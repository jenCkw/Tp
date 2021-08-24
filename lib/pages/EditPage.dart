import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/ListUsersPage.dart';

class EditPage extends StatefulWidget {
  // var
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Dio _dio = Dio();
  var nomController = TextEditingController();
  var prenomController = TextEditingController();
  var postnomController = TextEditingController();
  var sexeController = TextEditingController();
  var addresseController = TextEditingController();
  var contactController = TextEditingController();
  var mailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text('Edit item'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customInput(nomController, width: screenSize.width, hint: 'Nom'),
              customInput(prenomController,
                  width: screenSize.width, hint: 'Prenom'),
              customInput(postnomController,
                  width: screenSize.width, hint: 'Postnom'),
              customInput(sexeController,
                  width: screenSize.width, hint: 'sexe'),
              customInput(addresseController,
                  width: screenSize.width, hint: 'addresse'),
              customInput(contactController,
                  width: screenSize.width, hint: 'contact'),
              customInput(mailController,
                  width: screenSize.width, hint: 'mail'),
              customInput(usernameController,
                  width: screenSize.width, hint: 'user name'),
              customInput(passwordController,
                  width: screenSize.width, hint: 'password'),
              SizedBox(height: 10),
              customButton(
                screenSize,
                title: 'S\'inscrire',
                ontap: () => postStudents(),
              ),
              SizedBox(height: 10),
              customButton(
                screenSize,
                title: 'Tous les etudiants',
                ontap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListUsersPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customInput(controller, {width, hint}) {
    return Container(
      height: 50,
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: '$hint'),
      ),
    );
  }

  Widget customButton(screenSize, {title, VoidCallback ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: screenSize.width / 2,
        alignment: Alignment.center,
        color: Colors.amber,
        height: 50,
        child: Text('$title'),
      ),
    );
  }

  postStudents() async {
    var _data = {
      "nom": nomController.text,
      "prenom": prenomController.text,
      "postnom": postnomController.text,
      "sexe": sexeController.text,
      "addresse": addresseController.text,
      "contact": contactController.text,
      "mail": mailController.text,
      "username": usernameController.text,
      "password": passwordController.text,
    };

    try {
      var response = await _dio.post(
        'http://192.168.137.1:3535/students/create',
        data: _data,
      );
      return response.data;
    } catch (e) {
      print('$e');
    }
  }
}
