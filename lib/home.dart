// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/app_bar.dart';

class HomePage extends StatelessWidget {
  double getSmallDiamter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiamter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context)
        .size
        .height; // Device Height (Include AppBar and StatusBar)
    final appBarHeight = AppBar().preferredSize.height; // AppBar Height
    final statusBarHeight =
        MediaQuery.of(context).padding.top; // Status Bar Height

    final bodyHeight = deviceHeight - appBarHeight - statusBarHeight;

    return Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        body: Stack(
          children: [
            Positioned(
              right: (-getSmallDiamter(context) /
                  3), // Position Right "minus getSmallerDiamter() / 3"
              top: (-getSmallDiamter(context) / 3),
              child: Container(
                width: getSmallDiamter(context),
                height: getSmallDiamter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: const [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
            Positioned(
              left: (-getSmallDiamter(context) /
                  4), // Position Right "minus getSmallerDiamter() / 4"
              top: (-getSmallDiamter(context) / 4),
              child: Container(
                width: getBigDiamter(context),
                height: getBigDiamter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: const [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                    child: Text(
                  'dribble',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontSize: 36),
                )),
              ),
            ),
            Positioned(
              right: (-getBigDiamter(context) /
                  3), // Position Right "minus getSmallerDiamter() / 4"
              bottom: (-getBigDiamter(context) / 3),
              child: Container(
                width: getSmallDiamter(context),
                height: getSmallDiamter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 245, 181, 213)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16)),
                    margin: EdgeInsets.fromLTRB(20, 350, 20, 10),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Your E-mail',
                              labelText: 'E-mail',
                              labelStyle: TextStyle(color: Color(0xFFFF4891)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFFFF4891),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFF4891)))),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Your Password',
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xFFFF4891)),
                              prefixIcon: Icon(
                                Icons.key,
                                color: Color(0xFFFF4891),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFF4891)))),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFFF4891)),
                          ))),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Another Custom Button
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFB226B2),
                                      Color(0xFFFF6DA7)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Material(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(24),
                                splashColor: Colors.amber,
                                onTap: () {},
                                child: Center(
                                    child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ),
                        ),

                        // Another Custom Button
                        // Material(
                        //   borderRadius: BorderRadius.circular(
                        //       24), // Make sure u have same borderRadius with Outer Style (Container)
                        //   elevation: 5,
                        //   child: Container(
                        //     width: 120,
                        //     height: 50,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(24),
                        //       gradient: LinearGradient(
                        //           colors: const [
                        //             Color(0xFFB226B2),
                        //             Color(0xFFFF6DA7)
                        //           ],
                        //           begin: Alignment.topCenter,
                        //           end: Alignment.bottomCenter),
                        //     ),
                        //     child: Material(
                        //       borderRadius: BorderRadius.circular(
                        //           24), // Make sure u have same borderRadius with Outer Style (Container)
                        //       color: Colors
                        //           .transparent, // U need to use this if u already make a custom Container, so Material doesn't override Container Style
                        //       child: InkWell(
                        //         borderRadius: BorderRadius.circular(
                        //             24), // Make sure u have same borderRadius with Outer Style (Container)
                        //         onTap: () {},
                        //         splashColor: Colors
                        //             .blue, // U can change splashColor when u hold the Button
                        //         child: Center(
                        //             child: Text(
                        //           'Login',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         )),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //Floating Action Button
                        FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          mini: true,
                          child: Image(
                              image: AssetImage('assets/img/fb_icon.png')),
                        ),

                        FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          mini: true,
                          child: Image(
                              image: AssetImage('assets/img/twitter_icon.png')),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFF4891),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
