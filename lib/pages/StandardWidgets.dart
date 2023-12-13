import 'package:flutter/material.dart';
import 'package:task_trek/Colori.dart';

Widget StdBottomNavBar(String activate)
{
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colori.violet
      ),
      height: 70,
      width: 350,
      margin: const EdgeInsets.only(bottom: 30),
      child: activate == "home"? Home():activate == "ToDo"? ToDo():activate == "calendar"? Calendar():activate == "analytics"? Analytics():null,
    )
  );
}

Widget Home()
{
  return const Row(
    children: [

    ],
  );
}

Widget ToDo()
{
  return const Row(
    children: [

    ],
  );
}

Widget Calendar()
{
  return const Row(
    children: [

    ],
  );
}

Widget Analytics()
{
  return const Row(
    children: [

    ],
  );
}
