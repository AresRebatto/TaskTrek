import 'package:task_trek/DataBase.dart';
import 'dart:async';
enum activateState{
  attivo,
  pausa,
  fermo
}
class StopWatchTime {
  int _ore = 0;
  int _minuti = 0;
  int _secondi = 0;
  int? _idTask;

  //Attributi per l'interfaccia
  static String startText = "Premere per far\npartire il cronometro";
  static String testoCronometro = startText;
  String timetext = "00:00:00";
  static activateState attivo = activateState.fermo;

  StopWatchTime(){}

  StopWatchTime.fetch(this._idTask);

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
      timetext = "$_ore:$_minuti:$_secondi";
      print(timetext);
    }


  }

  //Una volta che si attiva, mette solo in pausa il funzionamento del metodo avviaTempo
  void mettiInPausa(){
    attivo = activateState.pausa;
  }

  //Quando il tempo viene bloccato, devi richiamare il metodo della
  //classe DBApp per inserire un nuovo valore nella tabella tempo
  Future<void> bloccaTempo() async{
    attivo = activateState.fermo;
  }
}