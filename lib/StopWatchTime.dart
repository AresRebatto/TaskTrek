import 'package:task_trek/DataBase.dart';
import 'dart:async';
import 'package:task_trek/Task.dart';
enum activateState{
  attivo,
  fermo
}
class StopWatchTime {
  int _ore = 0;
  int _minuti = 0;
  int _secondi = 0;
  int _idTask= 0;

  //Attributi per l'interfaccia
  static String startText = "Premere per far\npartire il cronometro";
  static String testoCronometro = startText;
  String timetext = "00:00:00";
  static activateState attivo = activateState.fermo;

  StopWatchTime(){}
  StopWatchTime.fetch(this._idTask, this._ore, this._minuti, this._secondi);

  void ChangeInterface()
  {
    testoCronometro = timetext;
  }

  ///Avvia il tempo dell'istanza generata
  Future<void> avviaTempo(int taskId) async{
    attivo = activateState.attivo;
    _idTask = taskId;
    while (attivo == activateState.attivo)
    {
      await Future.delayed(const Duration(seconds: 1));
      if(_secondi < 59)
        _secondi += 1;
      else if(_secondi == 59)
      {
        if(_minuti < 59)
        {
          _secondi = 0;
          _minuti += 1;
        }else
        {
          _secondi = 0;
          _minuti =0;
          _ore += 1;
        }
      }
      timetext = "${_ore <= 9? "0$_ore":_ore}:${_minuti <= 9? "0$_minuti":_minuti}:${_secondi <= 9? "0$_secondi":_secondi}";
    }


  }


  //Quando il tempo viene bloccato, devi richiamare il metodo della
  //classe DBApp per inserire un nuovo valore nella tabella tempo
  Future<void> bloccaTempo() async{
    attivo = activateState.fermo;
    DBApp.InsertTime(this._ore, this._minuti, this._secondi, this._idTask);

    _ore = 0;
    _minuti = 0;
    _secondi = 0;
  }

  ///Dato il nome di una task all'interno del DataBase come parametro
  ///ritorna la PK della suddetta Task.[Non funziona. Da riscrivere]
  static int? findTaskId(String searchString) {
    for (Task? task in DBApp.taskList) {
      if (task != null && task.Nome.contains(searchString)) {
        return task.taskId;
      }
    }
    return null;
  }

  static String ConcentrazioneTotale()
  {
    int ore = 0;
    int minuti = 0;
    int secondi = 0;
    String res = "";

    for(var elements in DBApp.timeList)
    {
      ore += elements.Ore;
      minuti += elements.Minuti;
      secondi += elements.Secondi;
    }

    if(ore < 9)
    {
      res += "0$ore:";
    }else {
      res += "$ore:";
    }

    if(minuti < 9)
    {
      res += "0$minuti:";
    }else {
      res += "$minuti:";
    }

    if(secondi < 9)
    {
      res += "0$secondi";
    }else {
      res += "$secondi";
    }
    return res;
  }
  static String ConcentrazioneMedia()
  {
    int ore = 0;
    int minuti = 0;
    int secondi = 0;
    String res = "";

    for(var elements in DBApp.timeList)
    {
      ore += elements.Ore;
      minuti += elements.Minuti;
      secondi += elements.Secondi;
    }

    ore = (ore/DBApp.timeList.length).round();
    minuti = (minuti/DBApp.timeList.length).round();
    secondi = (secondi/DBApp.timeList.length).round();

    if(ore < 9)
    {
      res += "0$ore:";
    }else {
      res += "$ore:";
    }

    if(minuti < 9)
    {
      res += "0$minuti:";
    }else {
      res += "$minuti:";
    }

    if(secondi < 9)
    {
      res += "0$secondi";
    }else {
      res += "$secondi";
    }
    return res;
  }

  //Properties
  int get Ore => _ore;
  int get Minuti => _minuti;
  int get Secondi => _secondi;
}