import 'package:flutter/material.dart';
import 'package:task_trek/Colori.dart';
import 'package:task_trek/pages/StandardWidgets.dart';
import 'package:task_trek/DataBase.dart';
import 'package:task_trek/StopWatchTime.dart';

class NewTaskState extends StatefulWidget {
  const NewTaskState({super.key});

  @override
  State<NewTaskState> createState() => NewTaskPage();
}
class NewTaskPage extends State<NewTaskState>{
  String newTaskName = "";
  String ore = "";
  String minuti = "";
  String secondi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar("Nuova Task"),
      backgroundColor: Colori.cream,
      body: Container(
        margin: const EdgeInsets.only(top: 100.0, right: 90.0),
        child: Column(
          children: [
            Container
            (
              width: 250.0,
              margin: const EdgeInsets.only(bottom: 90.0),
              child:TextField(
                decoration: InputDecoration(
                  hintText: 'Inserisci qui il nome della task',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (String? value){
                  newTaskName = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 170.0, bottom: 20.0),
              child: const Text(
                "Obiettivo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 5.0),
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ore',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (String? value){
                      ore = value!;
                    },
                  ),
                ),
                const Text(
                  ":",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (String? value){
                      minuti = value!;
                    },
                  ),
                ),
                const Text(
                  ":",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Sec',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (String? value){
                      secondi = value!;
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 300.0, left: 200.0),
              child: ElevatedButton(
                onPressed: () async{
                  setState(() {
                    DBApp.InsertTask(newTaskName);
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.pop(context);
                  await Future.delayed(const Duration(seconds: 5));
                  DBApp.InsertObjective(int.parse(ore), int.parse(minuti), int.parse(secondi), StopWatchTime.findTaskId(newTaskName)!);
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
                  "Salva",
                  style: TextStyle(
                    color: Colori.white,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}