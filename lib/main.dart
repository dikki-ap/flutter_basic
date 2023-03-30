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
            title: const Text('Flutter Basic'),
          ),
          body: Container(
            color: Colors.red[400],
            margin: const EdgeInsets.all(20), // For distance from outside Widget
            padding: const EdgeInsets.all(20), // For distance from Inside Widget
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.amber, Colors.blue])),
            ),
          )),
    );
  }
}
