import 'package:flutter/material.dart';
import 'package:task_trek/Colori.dart';

class NewTaskState extends StatefulWidget {
  const NewTaskState({super.key});

  @override
  State<NewTaskState> createState() => NewTaskPage();
}
class NewTaskPage extends State<NewTaskState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colori.cream,
        child: ListView(
          children: [],
        ),
      ),
    );
  }

}