import 'package:task_trek/DataBase.dart';

enum activateState{
  attivo,
  pausa,
  fermo
}
class StopWatchTime {
  int? _ore;
  int? _minuti;
  int? _secondi;
  int? _idTask;

  static String startText = "Premere per far\npartire il cronometro";
  static String testoCronometro = startText;
  String timetext = "00:00:00";
  static activateState attivo = activateState.fermo;

  StopWatchTime(idTask)
  {
    _ore = 0;
    _minuti = 0;
    _secondi = 0;
    _idTask = idTask;
    testoCronometro = timetext;
  }
  Future<void> avviaTempo(int taskId) async{
    attivo = activateState.attivo;
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