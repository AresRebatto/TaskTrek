import 'package:task_trek/Obiettivo.dart';
import 'package:task_trek/DataBase.dart';
import 'package:task_trek/StopWatchTime.dart';

class Task
{
  String _nome = "";
  Obiettivo? _obiettivo;
  int? _taskId;

  Task(String nome, int taskId, {int? ore, int? minuti, int? secondi})
  {
    if(ore != null && minuti != null && secondi != null) {
      _obiettivo = Obiettivo(taskId, ore, minuti, secondi);
    } else {
      _obiettivo = Obiettivo(taskId, 0,0,0);
    }
    _nome = nome;
    _taskId = taskId;
  }

  double SumTaskTimes() {
    double timeSum = 0;
    int ore = 0; int minuti = 0; int secondi = 0;

    if (_taskId == null) {
      return timeSum;
    }

    List<StopWatchTime> a =
    DBApp.timeList.where((time) => time.IdTask == _taskId).toList();

    for (var time in a) {
      ore += time.Ore;
      minuti += time.Minuti;
      secondi += time.Secondi;
    }

    timeSum = ((ore*3600)+(minuti*60)+secondi).toDouble();

    return timeSum;
  }

  static double SumTasksTimeFromDate(DateTime time)
  {
    List<StopWatchTime> a =
    DBApp.timeList.where((times) => times.Data.year == time.year && times.Data.month == time.month && times.Data.day == time.day).toList();

    if(a.isEmpty){return 0;}
    return ((a.map((item) => item.Ore).reduce((a, b) => a + b))
        +(a.map((item) => item.Minuti).reduce((a, b) => a + b)/60)
        +(a.map((item) => item.Secondi).reduce((a, b) => a + b)/3600)).toDouble();

  }

  //Properties
  String get Nome => _nome;
  int? get taskId => _taskId;
}