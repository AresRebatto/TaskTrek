import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_trek/Task.dart';
import 'package:task_trek/StopWatchTime.dart';

///DataBase class per la connessione al DataBase su supabase
class DBApp{
  //Dati per l'accesso al Db su SupaBase
  static const String _url = "https://uqjxahjhvogsrhyeqely.supabase.co";
  static const String _anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVxanhhaGpodm9nc3JoeWVxZWx5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI0NjcwNjEsImV4cCI6MjAxODA0MzA2MX0.4LKRjA8ObpyqqA5kOUqPa6ife_emx-QckeQdfwKpwpE";

  //Liste per caricare in locale i dati sul DB
  static List<Task>? taskList;
  static List<StopWatchTime>? timeList;

  ///E' un metodo che va richiamato ogni volta che si vuole usare il Db e serve per aprire
  ///la connessione con esso
  static Future<void> Inizialize() async
  {
    try{
      await Supabase.initialize(url: _url, anonKey: _anonKey);
    }catch(e)
    {
      //throw ConnectionException("Non è stato possibile connettersi al DB per il seguente motivo: $e");
      print("Non è stato possibile connettersi al DB per il seguente motivo: $e");
    }
  }

  static Future<void> FetchAll() async{
    try{
      FetchTasks();
      FetchTime();
    }catch(e)
    {
      throw FetchException("Non è stato possibile scaricare i dati per il seguente motivo: $e");
    }
  }
  ///Metodo che inserisce il valore specificato come paramentro come nuovo
  ///record della tabella Task sul DB
  static Future<void> InsertTask(var value) async
  {
    try{
      await Supabase.instance.client.from('Task').insert({'Nome': value}); //Inserisce il valore sul DB
      FetchTasks();//Scarica i dati e aggiorna la lista locale

    }catch(e)
    {
      print("Non è stato possibile connettersi al DB per il seguente motivo: $e");
      //throw InsertException("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
    }

  }

  ///Scarica tutti i record della tabella Task e li carica in una variabile data, grazie
  ///alla quale poi verranno suddivisi e diventeranno membri di una lista di istanze di Task
  static Future<void> FetchTasks() async{
    try{
      taskList?.clear();
      final data = await Supabase.instance.client.from('Task').select();
      for(var element in data)
      {
        taskList?.add(Task(element['Nome'], element['PK_TakId']));
      }

    }catch(e){
      throw FetchException("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
    }
  }
  ///Inserisce un valore di un nuovo tempo all'interno del DataBase
  static Future<void> InsertTime(int hours, int minutes, int seconds, int FK) async{
    try{
      await Supabase.instance.client.from('Tempo').insert({'FK_TaskId': FK, 'Ore': hours, 'Minuti': minutes, 'Secondi': seconds});
      FetchTime();
      //FetchTime();
    }catch(e)
    {
      throw InsertException("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
    }
  }

  ///Scarica tutti i record dalla tabella contenente i dati del tempo del DataBase e li inserisce tuttu
  ///in una lista creata appositamente
  static Future<void> FetchTime() async{
    try{
      timeList?.clear();
      final data = await Supabase.instance.client.from('Tempo').select();
      for(var element in data)
      {
        timeList?.add(StopWatchTime.fetch(element['FK_TaskId'], element['Ore'], element['Minuti'], element['Secondi']));
      }

    }catch(e){
      throw FetchException("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
    }
  }
}

//Classi per la definizione di eccezioni specifiche per il DataBase
class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class ConnectionException extends DatabaseException {
  ConnectionException(String message) : super(message);
}

class InsertException extends DatabaseException {
  InsertException(String message) : super(message);
}

class FetchException extends DatabaseException {
  FetchException(String message) : super(message);
}