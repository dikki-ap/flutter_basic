// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_basic/home.dart';

void main() {
  runApp(const MyApp());
  // Setting always Potrait Up
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) => {runApp(const MyApp())});
}

// U don't need StatefulWidget if are using Provider State Management
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
