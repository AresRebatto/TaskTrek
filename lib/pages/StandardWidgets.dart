import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/DataBase.dart';
import 'package:task_trek/pages/ToDo.dart';
import 'package:task_trek/pages/Calendar.dart';
import 'package:task_trek/pages/Analytics.dart';
import 'home.dart';

DateTime data = DateTime.now();
class NewToDoBtnState extends StatefulWidget{
  NewToDoBtnState(DateTime dat)
  {
    data = dat;
  }
  @override
  State<StatefulWidget> createState() => NewToDoBtn();

}

class NewToDoBtn extends State<NewToDoBtnState>
{
  String newToDoName = "";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 550, left: 20, right: 20),
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Inserisci il testo qui',
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (String? value){
              newToDoName = value!;
            },
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          margin: const EdgeInsets.only(top: 550),
          child: ElevatedButton(
              onPressed: () async{
                DBApp.InsertToDo(newToDoName, data);
                setState(() {
                  _controller.clear();
                });
                await Future.delayed(const Duration(seconds: 3));
                setState(() {
                  NewToDoBtnState(data);
                });

              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colori.brown,
                backgroundColor: Colori.violet,
              ).merge(
                  ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Cambia il tuo radius qui
                      ),
                    ),
                  )
              ),
              child: Text(
                "+",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Colori.white
                ),
              )
          )
        )
      ],
    );
  }
}

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
           CupertinoPageRoute(builder: (contesto) => ToDoPageState()),);
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
           CupertinoPageRoute(builder: (contesto) => const CalendarState()),);
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
           CupertinoPageRoute(builder: (contesto) => const AnalyticsPage()),);
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
            CupertinoPageRoute(builder: (contesto) => const HomePageState()),);
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
            CupertinoPageRoute(builder: (contesto) => const CalendarState()),);
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
            CupertinoPageRoute(builder: (contesto) => const AnalyticsPage()),);
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
            CupertinoPageRoute(builder: (contesto) => const HomePageState()),);
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
            CupertinoPageRoute(builder: (contesto) => const ToDoPageState()),);
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
            CupertinoPageRoute(builder: (contesto) => const AnalyticsPage()),);
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
            CupertinoPageRoute(builder: (contesto) => const HomePageState()),);
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
            CupertinoPageRoute(builder: (contesto) => const ToDoPageState()),);
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
            CupertinoPageRoute(builder: (contesto) => const CalendarState()),);
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



