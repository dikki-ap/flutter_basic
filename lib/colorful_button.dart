import 'dart:math';

import 'package:flutter/material.dart';

class ColorfulButton extends StatefulWidget {
  // Declare mainColor and secondColor
  Color mainColor, secondColor;
  // Declare iconData
  IconData iconData;

  // Create a Constructor
  ColorfulButton(this.mainColor, this.secondColor, this.iconData, {super.key});

  @override
  State<ColorfulButton> createState() => _ColorfulButtonState(
      mainColor, secondColor, iconData); // Put the var into constructor
}

class _ColorfulButtonState extends State<ColorfulButton> {
  // Declare mainColor and secondColor
  Color mainColor, secondColor;
  // Declare iconData
  IconData iconData;

  // Declare condition isPressed with default value false
  bool isPressed = false;

  // Create a constructor that send to ColorfulButton Class
  _ColorfulButtonState(this.mainColor, this.secondColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // Using Transform.rotate to rotating the Background
      angle: pi / 4, // Using pi / 4
      child: GestureDetector(
        // tapDown, when pressed, setState isPressed and change the Color
        onTapDown: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        // tapUp, when finished pressing, setState isPressed and change the Color
        onTapUp: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        // onTapCancel, when tap, and then cursor move outsite the Object change the Color
        onTapCancel: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Material(
          // Wrap it by Material to add elevation and shadowColor
          elevation: (isPressed)
              ? 5
              : 10, // Check isPressed and change the elevation value
          borderRadius: BorderRadius.circular(16),
          shadowColor: (isPressed)
              ? secondColor
              : mainColor, // Check isPressed and change the Color
          child: ClipRRect(
            // Wrap it into ClipRRect to create Rounded Rectangle, so diagonal decoration will be push into Stack
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              // Base Stack
              children: [
                SizedBox(
                  // Creating SizedBox to create Base layer "width" and "height"
                  height: 50,
                  width: 50,
                  child: Material(
                    // Using Material to add color and borderRadius and Icon
                    borderRadius: BorderRadius.circular(16),
                    color: (isPressed)
                        ? secondColor
                        : mainColor, // Check isPressed and change the Color
                    child: Transform.rotate(
                      // Using Transform.rotate to rotating an Object Icon
                      angle:
                          pi / -4, // Create rotate opposite from the Background
                      child: Icon(
                        iconData,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  // Using Transform.translate to move the Object from (dx, dy) position
                  offset: const Offset(30, 30),
                  child: SizedBox(
                    // Creating diagonal decoration
                    height: 50,
                    width: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Transform.translate(
                  // Using Transform.translate to move the Object from (dx, dy) position
                  offset: const Offset(-30, -30),
                  child: SizedBox(
                    // Creating diagonal decoration
                    height: 50,
                    width: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Transform.translate(
                  // Using Transform.translate to move the Object from (dx, dy) position
                  offset: const Offset(-30, 30),
                  child: SizedBox(
                    // Creating diagonal decoration
                    height: 50,
                    width: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Transform.translate(
                  // Using Transform.translate to move the Object from (dx, dy) position
                  offset: const Offset(30, -30),
                  child: SizedBox(
                    // Creating diagonal decoration
                    height: 50,
                    width: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
