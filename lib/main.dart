// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.adb),
        title: Text(
          'Card Widget',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0096ff), Color(0xff6610f2)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
              image: DecorationImage(
                  image: AssetImage('assets/img/pattern.png'),
                  fit: BoxFit.none,
                  repeat: ImageRepeat.repeat)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.green,
        child: ListView(
          children: [
            buildCard(Icons.search, 'Search'),
            buildCard(Icons.account_box, 'Account'),
            buildCard(Icons.phone, 'Call'),
          ],
        ),
      ),
    ));
  }

  // Extract Method to create Card
  // Need 2 params, IconData, and Text (U CAN CUSTOM IT)
  Card buildCard(IconData iconData, String text) {
    return Card(
      child: Row(
        children: [
          Container(margin: EdgeInsets.all(8), child: Icon(iconData)),
          Text(text)
        ],
      ),
    );
  }
}
