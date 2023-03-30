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
          title: Text('Image Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.black,
                child: Image(
                  image: AssetImage('assets/img/kost_1.png'),
                  fit: BoxFit.cover, // Default "BoxFit.contain"
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.black,
                child: Image(
                    image: AssetImage('assets/img/kost_2.png'),
                    fit: BoxFit.contain, // Default "BoxFit.contain"
                    repeat: ImageRepeat
                        .repeat // Using "repeat" if the image doesn't fill all Contianer
                    ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.black,
                child: Image(
                    // Using NetworkImage
                    image: NetworkImage(
                        'https://media.hrs.com/media/image/b9/9a/93/Medical_Kost-Melati-Aussenansicht-907283_600x600.jpg'),
                    fit: BoxFit.contain, // Default "BoxFit.contain"
                    repeat: ImageRepeat
                        .repeat // Using "repeat" if the image doesn't fill all Contianer
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
