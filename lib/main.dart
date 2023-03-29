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
        body: Center(
            child: Container(
              width: 200,
              height: 150,
              padding: const EdgeInsets.all(16.0),
              color: Colors.lightBlue,
              child: const Text(
                      'This is example paragraph for Widget text in Flutter Basic App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
            )),
      ),
    );
  }
}
