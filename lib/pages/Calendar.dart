import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Colori.dart';
import 'StandardWidgets.dart';
import 'package:task_trek/Evento.dart';

class CalendarState extends StatefulWidget
{
  const CalendarState({super.key});

  @override
  State<CalendarState> createState() => CalendarPage();

}
class CalendarPage extends State<CalendarState>
{
  var currentDate = DateTime.now();
  List<Event> dayEvents = Event.GetspecificEvent(DateTime.now());
  void DaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      currentDate = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(),
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
                  onPageChanged: (DateTime? calendarDate){
                    setState(() {
                      dayEvents = Event.GetspecificEvent(calendarDate!);
                    });
                  },
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Column(
                    children: [
                      if(dayEvents.isNotEmpty)
                        for(var elements in dayEvents)
                          Text(
                            "${elements.Nome}",
                          )
                    ],
                  ),
                )

              ],
            )

          ),
          StdBottomNavBar("calendar", context),
        ]
      )
    );
  }

  PreferredSize CalendarAppBar(){
    return PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
            color: Colori.violet,
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              alignment: Alignment.center,
              child: Text(
                    "calendario",
                    style: TextStyle(
                        color: Colori.white,
                        fontSize: 22
                    ),
                  ),
            )
        )

    );
  }

}