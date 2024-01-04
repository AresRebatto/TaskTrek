import 'package:task_trek/DataBase.dart';

class Event{
  String _nome = "";
  DateTime _data = DateTime.now();
  int PK = 0;

  Event(this._nome, this._data, this.PK);

  static List<Event> GetspecificEvent(DateTime data)
  {
    return DBApp.eventsList.where((elemento) => elemento.Data.year == data.year && elemento.Data.month == data.month && elemento.Data.day == data.day).toList();
  }

  String get Nome => _nome;
  DateTime get Data => _data;
}