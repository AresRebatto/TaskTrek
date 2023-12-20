import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Colori.dart';
import 'StandardWidgets.dart';

class CalendarState extends StatefulWidget
{
  const CalendarState({super.key});

  @override
  State<CalendarState> createState() => CalendarPage();

}
class CalendarPage extends State<CalendarState>
{
  var currentDate = DateTime.now();

  void DaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      currentDate = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colori.cream,
            child: ListView(
              children: [
                TableCalendar(
                  focusedDay: currentDate,
                  headerStyle: const HeaderStyle(formatButtonVisible: false),
                  firstDay: DateTime.utc(2010, 10,16),
                  lastDay: DateTime.utc(2030, 10, 16),
                  onDaySelected: DaySelected,
                  selectedDayPredicate: (day) => isSameDay(day, currentDate),
                )
              ],
            )

          ),
          StdBottomNavBar("calendar", context),
        ]
      )
    );
  }

}