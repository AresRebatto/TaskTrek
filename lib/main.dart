import 'package:flutter/material.dart';
import 'package:task_trek/pages/home.dart';

//Import per debuggin[Da rimuovere]
import 'package:task_trek/DataBase.dart';
import 'package:task_trek/StopWatchTime.dart';
import 'package:task_trek/Task.dart';

void main() {
  //metodi per inizializzare e scaricare tutti i dati in locale
  DBApp.Inizialize();
  DBApp.FetchAll();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Jost'),
      home: const HomePageState(),
    );
  }
}


