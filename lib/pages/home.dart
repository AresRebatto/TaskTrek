import 'package:flutter/material.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/StopWatchTime.dart';
import 'package:task_trek/Task.dart';
import 'package:task_trek/pages/NewTaskPage.dart';


class HomePageState extends StatefulWidget {
  const HomePageState({super.key});

  @override
  State<HomePageState> createState() => HomePage();
}
class HomePage extends State<HomePageState>{
  StopWatchTime time = StopWatchTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colori.cream,
            child: ListView(
              children: [
                TaskSelect(context),
                Align(
                  alignment: Alignment.center,
                  child: StopWatch(time),
                ),
              ],
          )
          ),
          StdBottomNavBar("home", context), //Bottom NavBar
        ],
      ),
    );
  }

  Widget TaskSelect(var contesto)
  {
    return Container(
      width: 50,
      margin: const EdgeInsets.only(right: 130, left: 130, top: 100),

      child:DropdownButton<String>(
          value: "",
          icon: Icon(
          Icons.arrow_drop_down,
          color: Colori.darkBrown,
        ),
        items: const[
          DropdownMenuItem(
            value: "",
            child: Text(
              "",
              style: TextStyle(
                  fontSize: 13.5
              ),
            )
            ,),
          DropdownMenuItem(
            value: "NewTask",
              child: Text(
                  "Crea una nuova Task",
                  style: TextStyle(
                    fontSize: 13.5
                  ),
              )
            ,)
        ],
        onChanged: (String? selectValue){
          if(selectValue == "NewTask"){
            Navigator.push(
              contesto,
              MaterialPageRoute(builder: (contesto) => const NewTaskState()),);
          }

        }
      )
    );
  }
  Widget StopWatch(nuovoTempo)
  {
    return GestureDetector(
      onTap: ()async{
        print(StopWatchTime().findTaskId("Ar"));
        if(StopWatchTime.attivo == activateState.fermo)
        {
          setState(() {
            nuovoTempo.ChangeInterface();
          });
          StopWatchTime.attivo = activateState.attivo;
          nuovoTempo.avviaTempo(1);
          //Solo per aggiornare interfaccia
          while(StopWatchTime.attivo == activateState.attivo){
            await Future.delayed(const Duration(seconds: 1));
            setState((){
              if(StopWatchTime.attivo == activateState.attivo)
                StopWatchTime.testoCronometro = nuovoTempo.timetext;
            });

          }
        }else {
          StopWatchTime.testoCronometro = StopWatchTime.startText;
          nuovoTempo.bloccaTempo();
        }
        setState((){

        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 120),
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
