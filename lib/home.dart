// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_basic/provider/cart.dart';
import 'package:flutter_basic/provider/money.dart';
import 'package:provider/provider.dart';

/*
  -- Provider State Management --
  If u want to use Provider State Management, u need to add library from pub.dev

  1. U need to create SharedState that implements ChangeNotifier
  ChangeNotifier functions to notify if there are changes that to the SharedState

  2. U need to wrap the ROOT Widget like Scaffold using "ChangeNotifierProvider" Widget and declare "create" property

  3. If u already create SharedState that implements ChangeNotifer and wrap the ROOT Widget,
  u need to wrap the Widget that will be changed using "Consumer" Widget
  "Consumer" Widget will be receive the info about changes from ChangeNotifierProvider

  4. The last one, u need to add "builder" property on each Consumer Widget
  "builder" property need function that need 3 params, but u can use just 2 params, and leave it the last one with "_"
*/

// U don't need StatefulWidget if are using Provider State Management
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // If u want to using multiProvider u can't use ChangeNotifierProvider to wrap Scaffold, u need to use MULTIPROVIDER
    return MultiProvider(
      providers: [
        // U can declare all of ChangeNotifier in this property
        ChangeNotifierProvider(create: (context) => Money()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: Scaffold(
        /*
          Because FloatingActionButton need more than 1 Consumer from Money and Cart
          u need to nested wrap "Consumer" Widget on FloatingActionButton
         */
        floatingActionButton: Consumer<Cart>(
          builder: (context, cart, _) => Consumer<Money>(
            builder: (context, money, _) => FloatingActionButton(
              onPressed: () {
                if (money.balance >= 500) {
                  cart.quantity += 1;
                  money.balance -= 500;
                }
              },
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.add_shopping_cart,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Multi Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Balance'),
                  Container(
                    width: 150,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.purple[100],
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<Money>(
                        builder: (context, money, _) => Text(
                          money.balance.toString(),
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Align(
                  alignment: Alignment.centerRight,
                  // Wrap Row with "Consumer" Widget
                  child: Consumer<Cart>(
                    builder: (context, cart, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Apple (500) x ${cart.quantity.toString()}',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (500 * cart.quantity).toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<Cart>(
                builder: (context, cart, _) => Consumer<Money>(
                  builder: (context, money, _) => ElevatedButton(
                      onPressed: () {
                        if (cart.quantity > 0) {
                          cart.quantity -= 1;
                          money.balance += 500;
                        }
                      },
                      child: Text('Substract')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
