// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/models/People.dart';
import 'package:flutter_basic/models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  People? people;
  User? user;
  String outputUsers = 'No Data (All Users)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API Demo (POST & GET Method)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    (people != null)
                        ? 'id: ${people?.id} | name: ${people?.name} | age: ${people?.age.toString()} | job: ${people?.job} | createdAt: ${people?.createdAt}'
                        : 'Data not Found (POST Method)',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    (user != null)
                        ? 'id: ${user?.id} | first_name: ${user?.first_name} | last_name: ${user?.last_name} | full_name: ${user?.full_name} | email: ${user?.email}'
                        : 'Data not Found (GET Method)',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    outputUsers,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        People.connectToAPI(
                                "Dikki AP", "22", "Flutter Developer")
                            .then((value) {
                          people = value;
                          setState(() {});
                        });
                      },
                      child: Text('POST Method')),
                  ElevatedButton(
                      onPressed: () {
                        User.connectToAPI(10).then((value) {
                          user = value;
                          setState(() {});
                        });
                      },
                      child: Text('GET Single Method')),
                  ElevatedButton(
                      onPressed: () {
                        User.getUsers(1).then((users) {
                          outputUsers = '';
                          for (var i = 0; i < users.length; i++) {
                            outputUsers +=
                                '[ id: ${users[i].id} | first_name: ${users[i].first_name} | last_name: ${users[i].last_name} | full_name: ${users[i].full_name} email: ${users[i].email} ]\n';
                          }
                          setState(() {});
                        });
                      },
                      child: Text('GET ALL Method')),
                ],
              )
            ],
          ),
        ));
  }
}
