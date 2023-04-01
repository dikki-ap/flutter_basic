// ignore_for_file: file_names
import 'dart:convert';

import 'package:http/http.dart' as http;

class People {
  String? id;
  String? name;
  String? age;
  String? job;
  String? createdAt;

  // Creating a Constructor
  People({this.id, this.name, this.age, this.job, this.createdAt});

  // Making a factory to create an Object from this Class
  factory People.createPeople(Map<String, dynamic> object) {
    return People(
      id: object['id'],
      name: object['name'],
      age: object['age'],
      job: object['job'],
      createdAt: object['createdAt'],
    );
  }

  // Create a function that connect to API and send data
  // U need async because it return Future value
  static Future<People> connectToAPI(String name, String age, String job) async {
    var url = Uri.https('reqres.in', 'api/users');

    // Using "await" because "post()" method return Future value
    var result =
        await http.post(url, body: {"name": name, "age": age, "job": job});

    // Change the result into a JSON Object
    var jsonObject = json.decode(result.body);

    // And return the JSON Object into createPeople method, so it will be parsing into Map
    return People.createPeople(jsonObject);
  }
}
