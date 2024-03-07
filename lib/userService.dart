import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Name {
  final String first;

  final String last;

  const Name({
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(first: json['first'], last: json['last']);
  }
}

class User {
  final String email;
  
  final Name name;

  User({required this.email, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        
        name: Name.fromJson(json['name']));
  }
}

class Userservice {
  Future<List<User>> getuser() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<User> list = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(User.fromJson(entry));
      }

      return list;
    } else {
      throw Exception('falied http');
    }
  }
}
