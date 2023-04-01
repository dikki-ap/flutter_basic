// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

AppBar appBar(String title, List<Tab> tabMenu) {
  return AppBar(
    leading: Icon(Icons.adb),

    // Wrap Container using PreferredSize, because "bottom" property need PreferredSize Widget
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(tabBar(tabMenu)
            .preferredSize
            .height), // Get height tabBar from function
        // Wrap tabBar using Container to add color
        child: Container(
          color: Colors.amber,
          child: tabBar(tabMenu), // Adding tabBar to appBar
        )),
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

// Make a tabBar into Function, to get height from tabBar
TabBar tabBar(List<Tab> tabMenu) => TabBar(
    // "indicator" property using BoxDecoration to change backgroundColor when selected
    // "indicatorColor" property for changing indicator on bottm when selected
    indicator: BoxDecoration(
        // "border" property to create border when selected, or u can use "indicatorColor" property
        border: Border(top: BorderSide(color: Colors.black, width: 5)),
        gradient: LinearGradient(
            colors: const [Colors.white, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)),
    tabs: tabMenu);
