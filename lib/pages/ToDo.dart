import 'package:flutter/material.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/Colori.dart';

class ToDoPage extends StatelessWidget
{
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colori.cream,
              child: ListView(
                children: [
                ],
              )

          ),
          StdBottomNavBar("ToDo", context),

          //Bottom NavBar
        ],
      ),
    );
  }

}