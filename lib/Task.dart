import 'package:task_trek/Obiettivo.dart';
import 'package:task_trek/DataBase.dart';

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

  String get Nome => _nome;
  int? get taskId => _taskId;
}