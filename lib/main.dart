import 'package:api_app/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "api_app",
      theme: ThemeData(primarySwatch: Colors.amber),
      home:  Homepage(),
    );
  }
}