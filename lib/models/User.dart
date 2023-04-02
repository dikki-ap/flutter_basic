// ignore_for_file: file_names
import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  // MAKE SURE CHECK THE RESPONSE FROM API
  int? id; // Making a int because the response from API
  String? first_name;
  String? last_name;
  String? full_name;
  String? email;

  User({this.id, this.first_name, this.last_name, this.full_name, this.email});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'],
      first_name: object['first_name'],
      last_name: object['last_name'],
      full_name: object['first_name'] + " " + object['last_name'],
      email: object['email'],
    );
  }

  // Make sure check the params and make sure check the response from API
  static Future<User> connectToAPI(int id) async {
    // Create an URL
    var url = Uri.https('reqres.in', 'api/users/$id');

    // Get the result from URL using "get" method
    var result = await http.get(url);

    // Take the "body" from URL because u are using "get" method
    var jsonObject =
        jsonDecode(result.body); // This is a full json response from API

    // Take "data" body from jsonObject and parsing to Map
    /*
      Response from API
      {
       "data"
            {
              "id": 2
              "first_name" : xxxx
            }
      }

      Object{Object['data']}
      so u need take the 'data' first and it's Map<String, dynamic>
     */
    // MAKE SURE CHECK THE RESPONSE FROM API
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
