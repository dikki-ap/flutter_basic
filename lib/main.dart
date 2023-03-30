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
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Text 1'),
              SizedBox(width: 8.0,),
              Text('Text 2'),
              SizedBox(width: 8.0,),
              Text('Text 3'),
            ],
          )),
    );
  }
}
