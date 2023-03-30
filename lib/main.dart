// ignore_for_file: prefer_const_constructors
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
  // Declare a default Color
  Color color1 = Colors.red;
  Color color2 = Colors.green;

  // Declare targetColor
  Color? targetColor;

  // Declare condition when DragTarget already accepting value or not
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Draggable, Dragtarget, SizedBox, Material'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /*
                  -- Draggable --
                  Draggable need Generic Type, in this case we will use Color as a Generic Type
                  Need 3 Properties
                  "child" as a initial value
                  "childWhenDragging" as a initialValue when u dragging the Object
                  "feedback" as a Object when u dragging
                */
                Draggable<Color>(
                  data: color1,
                  feedback: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color1.withOpacity(0.6),
                      shape:
                          StadiumBorder(), // Make a Rectangle corner into Circular
                      elevation: 1, // DROP SHADOW
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: Colors.grey,
                      shape:
                          StadiumBorder(), // Make a Rectangle corner into Circular
                    ),
                  ), // "data" property, is a data that belongs to Draggable and will be sent to a DragTarget
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color1,
                      shape:
                          StadiumBorder(), // Make a Rectangle corner into Circular
                      elevation: 3, // DROP SHADOW
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAccepted = false;
                      });
                    },
                    child: Text('Reset Target Color')),
                Draggable<Color>(
                  data: color2,
                  feedback: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color2.withOpacity(0.6),
                      shape:
                          StadiumBorder(), // Make a Rectangle corner into Circular
                      elevation: 1, // DROP SHADOW
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: Colors.grey,
                      shape:
                          StadiumBorder(), // Make a Rectangle corner into Circular
                    ),
                  ), // "data" property, is a data that belongs to Draggable and will be sent to a DragTarget
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color2,
                      shape:
                          StadiumBorder(), // Make a Rectangle corner into Circular
                      elevation: 3, // DROP SHADOW
                    ),
                  ),
                ),
              ],
            ),

            /*
              -- DragTarget --
              DragTarget need Generic Type, in this case we using Color as Generic Type, same as Draggable "data"
              DragTarget need 3 properties

              "onWillAccept" , check if we want to accept the request from Draggable or not
              "onAccept" , making a condition when accepting request from Draggable
              "builder" , making a changes when accepting request from Draggable
              "builder" , need 3 params, (context, caandidateData, rejectedData)
            */
            DragTarget<Color>(
              onWillAccept: (value) => true, // Always accept changes
              onAccept: (value) {
                // When accepting request from Draggable, changes isAcceped and targetColor
                isAccepted = true;
                targetColor = value;
              },
              builder: (context, candidateData, rejectedData) {
                // Making a changes when accepting request from Draggable
                // Check isAccepted value, if True, change color to targetColor
                // if False, make it to Grey Color
                return (isAccepted)
                    ? SizedBox(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: targetColor,
                          shape:
                              StadiumBorder(), // Make a Rectangle corner into Circular
                          elevation: 3, // DROP SHADOW
                        ),
                      )
                    : SizedBox(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: Colors.grey,
                          shape:
                              StadiumBorder(), // Make a Rectangle corner into Circular
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
