// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller =
      TextEditingController(); // U can add defaultValue on TextEditingController(text: 'Default Value')

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.adb),
              title: Text(
                'TextField Widget',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff0096ff), Color(0xff6610f2)],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight),
                    image: DecorationImage(
                        image: AssetImage('assets/img/pattern.png'),
                        fit: BoxFit.none,
                        repeat: ImageRepeat.repeat)),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: EdgeInsets.all(16),
                    child: TextField(
                      maxLength: 10,
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller:
                          controller, // U need to make Controller into TextField
                      decoration: InputDecoration(
                          labelText: 'Fullname',
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Your fullname',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24))),
                    )),
                Text(controller.text)
              ],
            )));
  }
}
