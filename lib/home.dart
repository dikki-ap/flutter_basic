// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: "123456",
          // backgroundColor: Colors.grey,
          // foregroundColor: Colors.amber,
          errorCorrectionLevel: QrErrorCorrectLevel.M, // U can see documentation on their web
          size: 300,
          version: QrVersions.auto,),
      ),
    );
  }
}

