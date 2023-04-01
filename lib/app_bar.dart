// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

AppBar appBar(String title, List<Tab> tabMenu) {
  return AppBar(
    leading: Icon(Icons.adb),
    bottom: TabBar(tabs: tabMenu), // Adding tabBar to appBar
    title: Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
    ],
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: const [Color(0xff0096ff), Color(0xff6610f2)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight),
          image: DecorationImage(
              image: AssetImage('assets/img/pattern.png'),
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat)),
    ),
  );
}
