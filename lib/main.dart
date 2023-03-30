// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
    -- Flexible Widget --
    So when u want to make a proportional size of Widget, u can use Flexible
    u can set total size amount of Widget
    For example in this case study, we make a Column that have 3 Container
    - First one is 1/4 from Device Height
    - Second one is 2/4 or (1/2) from Device Height
    - Third one is 1/4 from Device Height

    So u can total it 1/4 + 2/4 + 1/4 = 4/4
    total amount is 4, so u can input in into "flex" property on Flexible Widget
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flexible Widget'),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 1, // Make a part that has 1 Flex from total 4 Flex
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.orange,
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.lightBlue,
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.green,
                        )),
                  ],
                )),
            Flexible(
                flex: 2, // Make a part that has 2 Flex from total 4 Flex
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.red,
                )),
            Flexible(
                flex: 1, // Make a part that has 1 Flex from total 4 Flex
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
