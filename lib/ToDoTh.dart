import 'package:task_trek/DataBase.dart';

class ToDoTh{
  String _nome = "";
  DateTime _data = DateTime.now();

  ToDoTh(this._nome, this._data);

  static List<ToDoTh> GetspecificToDo(DateTime data)
  {
    return DBApp.toDoList.where((elemento) => elemento.Data == data).toList();
  }
  String get Nome => _nome;
  DateTime get Data => _data;

}