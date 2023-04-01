// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_basic/home.dart';

void main() {
  runApp(const MyApp());
  // Setting always Potrait Up
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) => {runApp(const MyApp())});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
