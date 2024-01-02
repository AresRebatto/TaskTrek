import 'package:flutter/material.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/Colori.dart';



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
    if(statoPagina == Pagina.oggi)
      return ListView(
        children: [
          Text("data")
        ],
      );
    else
      return ListView(
        children: [
          Text("Hello")
        ],
      );
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