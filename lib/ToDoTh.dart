import 'package:task_trek/DataBase.dart';

class ToDoTh{
  String _nome = "";
  DateTime _data = DateTime.now();
  bool _state = false;

  ToDoTh(this._nome, this._data);
  ToDoTh.fetch(this._nome, this._data, this._state);

  ///Data una specifica data, lui restituisce una lista con all'interno tutti le istanze
  ///della lista delle cose da fare che hanno come valore dell'attributo data, quello
  ///specificato come parametro
  static List<ToDoTh> GetspecificToDo(DateTime data)
  {
    return DBApp.toDoList.where((elemento) => elemento.Data.year == data.year && elemento.Data.month == data.month && elemento.Data.day == data.day).toList();
  }

  void ChangeStatus()
  {
    _state = !_state;
    DBApp.UpdateToDo(_nome, _state);
  }

  //Properties
  String get Nome => _nome;
  DateTime get Data => _data;
  bool get State => _state;

}