import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Colori.dart';
import 'StandardWidgets.dart';
import 'package:task_trek/Evento.dart';
import 'package:task_trek/DataBase.dart';

class CalendarState extends StatefulWidget
{
  const CalendarState({super.key});

  @override
  State<CalendarState> createState() => CalendarPage();

}
class CalendarPage extends State<CalendarState>
{
  double heightColumn = 190.0;
  static var currentDate = DateTime.now();
  List<Event> dayEvents = Event.GetspecificEvent(DateTime.now());
  String newEventName = "";
  final TextEditingController _controller = TextEditingController();

  void DaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      currentDate = day;
      dayEvents = Event.GetspecificEvent(day);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar("calendario"),
      body: Stack(
        children: [
          Container(
            color: Colori.cream,
            child: Column(
              children: [
                TableCalendar(
                  calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colori.violet,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colori.todayColor,
                      )
                  ),
                  focusedDay: currentDate,
                  headerStyle: const HeaderStyle(formatButtonVisible: false),
                  firstDay: DateTime.utc(2010, 10,16),
                  lastDay: DateTime.utc(2030, 10, 16),
                  onDaySelected: DaySelected,
                  selectedDayPredicate: (day) => isSameDay(day, currentDate),

                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                  height: heightColumn,
                  child: ListView.builder(
                    itemCount: dayEvents.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            dayEvents[index].Nome,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0),
                            child: TextButton(
                              onPressed: (){
                                DBApp.RemoveEvent(dayEvents[index].PK);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colori.brown,
                              ),
                              child: const Text("Elimina"),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),

              ],
            )
          ),
          //New event
          Row(
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
                    newEventName = value!;
                  },
                  onTap: (){
                    setState(() {
                      heightColumn = 59.0;
                    });
                  },
                  onEditingComplete: (){
                    setState(() {
                      heightColumn = 190.0;
                    });
                  },
                ),
              ),
              Container(
                  width: 50.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(top: 550),
                  child: ElevatedButton(
                      onPressed: () async{
                        DBApp.InsertEvent(newEventName, currentDate);
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
          ),
          StdBottomNavBar("calendar", context),
        ]
      )
    );
  }



}
