import 'package:flutter/material.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/pages/ToDo.dart';


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
        width: 350,
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
     Container(
       margin: const EdgeInsets.only(left: 40),
       width: 60,
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30),
         color: Colori.brown,
       ),
       child: Image.asset("assets/home.png"),
     ),
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
     )

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

//Metodo per rimandare alla pagina del To-Do
ToToDoPage(var contesto)
{

}


