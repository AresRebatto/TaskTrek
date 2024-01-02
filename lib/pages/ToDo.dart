import 'package:flutter/material.dart';
import 'package:task_trek/ToDoTh.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/DataBase.dart';



class ToDoPageState extends StatefulWidget
{
  const ToDoPageState({super.key});

  @override

  State<ToDoPageState> createState() => ToDoPage();
}

enum Pagina{
  oggi,
  domani
}
class ToDoPage extends State<ToDoPageState>
{
  Pagina statoPagina = Pagina.oggi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToDoAppBar(),
      body: Stack(
        children: [
          Container(
              color: Colori.cream,
              child: Page()

          ),
          StdBottomNavBar("ToDo", context),

          //Bottom NavBar
        ],
      ),
    );
  }

  Widget Page()
  {
    if(statoPagina == Pagina.oggi) {
      return Stack(
        children: [
          ListView(
            children: [
              if(ToDoTh.GetspecificToDo(DateTime.now()).isEmpty)
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 250.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                        child:  Image.asset("assets/task.png"),
                      ),

                      Text(
                        "Al momento non hai ancora definito\nattività da svolgere per oggi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colori.darkBrown,
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                )

            ],
          ),
          NewToDoBtn(),
        ],
      );
    } else {
      return Stack(
        children: [
          ListView(
            children: [

            ],
          ),
          NewToDoBtn(),
        ],
      );
    }
  }
  PreferredSize ToDoAppBar(){
    return PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
            color: Colori.violet,
            child: Container(
              margin: const EdgeInsets.only(top: 50.0, left: 10.0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    "ToDo",
                    style: TextStyle(
                        color: Colori.white,
                        fontSize: 22
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12.0, left: 5),
                        child:TextButton(
                          onPressed: () {
                            setState(() {
                              statoPagina = Pagina.oggi;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colori.violet,
                            onPrimary: Colori.brown,
                          ),
                          child: Text(
                            "Oggi",
                            style: TextStyle(
                                color: Colori.white,
                                fontSize: 15
                            ),
                          )
                        ),
                      ),Container(
                        margin: const EdgeInsets.only(right: 20.0, left: 5),
                        child:TextButton(

                          onPressed: () {
                            setState(() {
                              statoPagina = Pagina.domani;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colori.violet,
                            onPrimary: Colori.brown,
                          ),
                          child: Text(
                            "Domani",
                            style: TextStyle(
                                color: Colori.white,
                                fontSize: 15
                            ),
                          )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        )

    );
}
}