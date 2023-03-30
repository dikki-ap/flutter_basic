// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> sampleText = [];

    for (var i = 1; i <= 25; i++) {
      sampleText.add(Text(
        'This is sample text $i',
        style: TextStyle(fontSize: 36),
      ));
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Stack & Align'),
          ),
          /*
            -- Stack --
            Like a stacking Widget, first Widget will be the base Layout (Bottom)
           */
          body: Stack(
            children: [
              // First Layout (Base)
              Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black12,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ))
                ],
              ),

              // Second Layout
              ListView(
                children: [
                  Column(
                    children: sampleText,
                  )
                ],
              ),

              // Third Layout
              Align(
                  /*
                    --- Align --
                    "alignment" property need 2 params "x" and "y"

                    For x:
                    1: Top
                    0: Middle
                    -1: Bottom

                    For y:
                    1: Bottom
                    0: Middle
                    -1: Top

                    If u want to adjust the position u can use custom number like double
                  */
                  alignment: Alignment(0, 0.75),
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Example Button')))
            ],
          )),
    );
  }
}
