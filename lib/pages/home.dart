import 'package:flutter/material.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/Colori.dart';

class HomePage extends StatelessWidget{
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
          StdBottomNavBar("home", context),

           //Bottom NavBar
        ],
      ),

    );
  }

}