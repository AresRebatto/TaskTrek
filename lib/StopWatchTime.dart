import 'package:task_trek/DataBase.dart';
import 'dart:async';
enum activateState{
  attivo,
  fermo
}
class StopWatchTime {
  int _ore = 0;
  int _minuti = 0;
  int _secondi = 0;
  int _idTask=22;

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

  Future<void> avviaTempo(int taskId) async{
    attivo = activateState.attivo;
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
      print(timetext);
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
}