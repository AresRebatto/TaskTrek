import 'package:flutter/material.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/StopWatchTime.dart';


class HomePageState extends StatefulWidget {
  const HomePageState({super.key});

  @override
  State<HomePageState> createState() => HomePage();
}
class HomePage extends State<HomePageState>{
  //String text = "Premere per far\npartire il cronometro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colori.cream,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: StopWatch(),
                ),
              ],
          )

          ),
          StdBottomNavBar("home", context),

           //Bottom NavBar
        ],
      ),
    );
  }


  Widget StopWatch()
  {

    return GestureDetector(
      onTap: ()async{
        setState((){
          if(!StopWatchTime.attivo)
          {
            StopWatchTime.testoCronometro = "Ciao";
          }else {
            StopWatchTime.testoCronometro = "Premere per far\npartire il cronometro";
          }

          StopWatchTime.attivo = !StopWatchTime.attivo;



        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 190),
        height: 260,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: Colori.cream,
          border: Border.all(
            color: Colori.darkBrown,
            width: 1.0,
          ),
        ),
        child: Align(
            alignment:Alignment.center,
            child:Text(
                StopWatchTime.testoCronometro,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                ),
            )
        )
      ),
    );
  }
}
