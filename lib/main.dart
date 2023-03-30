// ignore_for_file: prefer_const_constructors
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
            title: Text('Spacer Widget'),
          ),
          body: Center(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween, // This will be give space between Widget for the same amount
              children: [
                Spacer(
                  flex: 1,
                ), // Or u can use "flex" property on Spacer to make it Flexible
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Spacer(
                  flex: 2,
                ), // Or u can use "flex" property on Spacer to make it Flexible
                // Spacer(), // Or u can use Empty Spacer like this instead of spaceBetween
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                ),
                Spacer(
                  flex: 3,
                ), // Or u can use "flex" property on Spacer to make it Flexible
                // Spacer(), // Or u can use Empty Spacer like this instead of spaceBetween
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                ),
                Spacer(
                  flex: 2,
                ), // Or u can use "flex" property on Spacer to make it Flexible
              ],
            ),
          )),
    );
  }
}
