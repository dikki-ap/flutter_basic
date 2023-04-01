// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/models/People.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  People? people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API Demo (Post Method)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                (people != null)
                    ? 'id: ${people?.id} | name: ${people?.name} | age: ${people?.age.toString()} | job: ${people?.job} | createdAt: ${people?.createdAt}'
                    : 'Data not Found',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: () {
                    People.connectToAPI("Dikki AP", "22", "Flutter Developer")
                        .then((value) {
                      people = value;
                      setState(() {});
                    });
                  },
                  child: Text('Post Method'))
            ],
          ),
        ));
  }
}
