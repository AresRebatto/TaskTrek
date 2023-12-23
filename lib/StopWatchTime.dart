import 'package:task_trek/DataBase.dart';

class StopWatchTime {
  int? _ore;
  int? _minuti;
  int? _secondi;
  int? _idTask;

  static String testoCronometro = "Premere per far\npartire il cronometro";
  static bool attivo = false;

  StopWatchTime(idTask)
  {
    _ore = 0;
    _minuti = 0;
    _secondi = 0;
    _idTask = idTask;
  }
  Future<void> avviaTempo(int taskId) async{
    attivo = true;
  }

  //Una volta che si attiva, mette solo in pausa il funzionamento del metodo avviaTempo
  void mettiInPausa(){
    attivo = false;
  }

  //Quando il tempo viene bloccato, devi richiamare il metodo della
  //classe DBApp per inserire un nuovo valore nella tabella tempo
  Future<void> bloccaTempo() async{
    attivo = false;
    print("Il tempo si è fermato e i dati sono stati salvati nel database");
  }
}