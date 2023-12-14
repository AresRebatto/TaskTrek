import 'package:flutter/material.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/pages/ToDo.dart';
import 'package:task_trek/pages/Calendar.dart';
import 'package:task_trek/pages/Analytics.dart';

import 'home.dart';


dynamic contesto;

Widget StdBottomNavBar(String activate, dynamic context)
{
  contesto = context;
  return Align(
  alignment: Alignment.bottomCenter,
  child: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromRGBO(0, 0, 0, 0.300)
        ),
        height: 80,
        width: 350,

      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colori.violet
        ),
        height: 80,
        width: 365,
        margin: const EdgeInsets.only(bottom: 30),
        child: activate == "home"? Home():activate == "ToDo"? ToDo():activate == "calendar"? Calendar():activate == "analytics"? Analytics():null,
      )

    ],
  )

  );
}

Widget Home()
{
  return Row(
   children: [
     //Home
     Container(
       margin: const EdgeInsets.only(left: 33),
       width: 60,
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30),
         color: Colori.brown,
       ),
       child: Image.asset("assets/home.png"),
     ),
     //ToDoPage
     GestureDetector(
       onTap: (){
         Navigator.push(
           contesto,
           MaterialPageRoute(builder: (contesto) => ToDoPage()),);
       },
       child: Container(
         margin: const EdgeInsets.only(left: 20),
         width: 60,
         padding: const EdgeInsets.all(12),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
         ),
         child: Image.asset("assets/checkbox.png"),
       ),
     ),
     //Calendar page
     GestureDetector(
       onTap: (){
         Navigator.push(
           contesto,
           MaterialPageRoute(builder: (contesto) => CalendarPage()),);
       },
       child: Container(
         margin: const EdgeInsets.only(left: 20),
         width: 60,
         padding: const EdgeInsets.all(12),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
         ),
         child: Image.asset("assets/calendar.png"),
       ),
     ),
     //Analytics page
     GestureDetector(
       onTap: (){
         Navigator.push(
           contesto,
           MaterialPageRoute(builder: (contesto) => AnalyticsPage()),);
       },
       child: Container(
         margin: const EdgeInsets.only(left: 20),
         width: 60,
         padding: const EdgeInsets.all(12),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
         ),
         child: Image.asset("assets/graph.png"),
       ),
     )

   ],
  );
}

Widget ToDo()
{
  return Row(
    children: [

      //ToDoPage
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => HomePage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 33),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/home.png"),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        width: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colori.brown,
        ),
        child: Image.asset("assets/checkbox.png"),
      ),
      //Calendar page
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => CalendarPage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/calendar.png"),
        ),
      ),
      //Analytics page
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => AnalyticsPage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/graph.png"),
        ),
      )
    ],
  );
}

Widget Calendar()
{
  return Row(
    children: [
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => HomePage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 33),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/home.png"),
        ),
      ),

      //Calendar page
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => ToDoPage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/checkbox.png"),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        width: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colori.brown,
        ),
        child: Image.asset("assets/calendar.png"),
      ),
      //Analytics page
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => AnalyticsPage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/graph.png"),
        ),
      )

    ],
  );
}

Widget Analytics()
{
  return  Row(
    children: [
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => HomePage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 33),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/home.png"),
        ),
      ),

      //Calendar page
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => ToDoPage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/checkbox.png"),
        ),
      ),
      GestureDetector(
        onTap: (){
          Navigator.push(
            contesto,
            MaterialPageRoute(builder: (contesto) => CalendarPage()),);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset("assets/calendar.png"),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        width: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colori.brown,
        ),
        child: Image.asset("assets/graph.png"),
      ),
      //Analytics page

    ],
  );
}


