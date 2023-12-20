import 'package:flutter/material.dart';
import 'package:task_trek/pages/home.dart';
import 'package:task_trek/DataBase.dart';

void main() {
  runApp(const MyApp());
  //DBApp.Inizialize();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Jost'),
      home: HomePageState(),
    );
  }
}


