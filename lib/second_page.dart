// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // "pop" navigate to previous Screen and u can't go back into this Screen
              Navigator.pop(context);
            },
            child: Text('Back to Main Page')),
      ),
    );
  }
}
