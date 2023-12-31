import 'package:flutter/material.dart';
import 'package:task_trek/pages/home.dart';
import 'package:task_trek/DataBase.dart';
import 'package:task_trek/StopWatchTime.dart';
void main() {
  runApp(const MyApp());
  //metodi per inizializzare e scaricare tutti i dati in locale
  DBApp.Inizialize();
  DBApp.FetchAll();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Jost'),
      home: HomePageState(),
    );
  }
}


