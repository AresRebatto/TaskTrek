import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_trek/Task.dart';
import 'package:task_trek/StopWatchTime.dart';
import 'package:task_trek/Evento.dart';
import 'package:task_trek/ToDoTh.dart';

///DataBase class per la connessione al DataBase su supabase
class DBApp{
  //Dati per l'accesso al Db su SupaBase
  static const String _url = "https://uqjxahjhvogsrhyeqely.supabase.co";
  static const String _anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVxanhhaGpodm9nc3JoeWVxZWx5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI0NjcwNjEsImV4cCI6MjAxODA0MzA2MX0.4LKRjA8ObpyqqA5kOUqPa6ife_emx-QckeQdfwKpwpE";

  //Liste per caricare in locale i dati sul DB
  static List<Task> taskList =[];
  static List<StopWatchTime> timeList = [];
  static List<Event> eventsList = [];
  static List<ToDoTh> toDoList = [];

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

  ///Funzione per caricare tutte le liste in una volta. Utile da richiamare appena l'app
  ///viene avviata, nel main
  static Future<void> FetchAll() async{
    try{
      FetchTasks();
      FetchTime();
      FetchEvent();
      FetchToDo();
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
      taskList.clear();
      final data = await Supabase.instance.client.from('Task').select();
      for(var element in data)
      {

        taskList.add(Task(element['Nome'].toString(), element['PK_TakId'] as int));
        //for(var dot in taskList)
          //print(dot.Nome);
      }

    }catch(e){
      print("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
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
      print("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
    }
  }

  ///Scarica tutti i record dalla tabella contenente i dati del tempo del DataBase e li inserisce tuttu
  ///in una lista creata appositamente
  static Future<void> FetchTime() async{
    try{
      timeList.clear();
      final data = await Supabase.instance.client.from('Tempo').select();
      for(var element in data)
      {
        timeList.add(StopWatchTime.fetch(element['FK_TaskId'], element['Ore'], element['Minuti'], element['Secondi']));
      }

    }catch(e){
      throw FetchException("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
    }
  }

  ///Inserisce un valore di una nuova attività all'interno del DataBase
  static Future<void> InsertEvent(String nome, DateTime data) async{
    try{
      await Supabase.instance.client.from('Evento').insert({'Evento': nome, 'Data': "${data.year}-${data.month}-${data.day}"});
      FetchEvent();
      //FetchTime();
    }catch(e)
    {
      print("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
    }
  }

  ///Scarica tutti i record dalla tabella contenente i dati delle attività del DataBase e li inserisce tuttu
  ///in una lista creata appositamente
  static Future<void> FetchEvent() async{
    try{
      eventsList.clear();
      final data = await Supabase.instance.client.from('Evento').select();
      for(var element in data)
      {
        eventsList.add(Event(element['Evento'], DateTime.parse(element['Data']), element['PK_EventoId'] as int));
      }

    }catch(e){
      print("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
    }
  }

  ///Funzione per rimuovere un recordo della tabella Evento data la Primary Key
  static Future<void> RemoveEvent(pkEvent) async{
    try{
      await Supabase.instance.client.from('Evento').delete().match({ 'PK_EventoId': pkEvent });
      FetchEvent();
    }catch(e){
      print("Non è stato possibile eliminare il redord dal DB per il seguente motivo: $e");
    }

  }

  ///Inserisce un valore di una nuova cosa da fare all'interno del DataBase
  static Future<void> InsertToDo(String nome, DateTime data) async{
    try{
      await Supabase.instance.client.from('ToDo').insert({'Nome': nome, 'Data': "${data.year}-${data.month}-${data.day}"});
      FetchToDo();
      //FetchTime();
    }catch(e)
    {
      print("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
    }
  }

  ///Scarica tutti i record dalla tabella contenente i dati delle cose da fare del DataBase e li inserisce tutto
  ///in una lista creata appositamente
  static Future<void> FetchToDo() async{
    try{
      toDoList.clear();
      final data = await Supabase.instance.client.from('ToDo').select();
      for(var element in data)
      {
        toDoList.add(ToDoTh.fetch(element['Nome'], DateTime.parse(element['Data']), element['Fatto'], element['id'] as int));

      }

    }catch(e){
      print("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
    }
  }
  ///Modifica lo stato di un attività da fare con quello definito come parametro, che sia esso vero o falso
  static Future<void> UpdateToDo(String td, bool state) async{
    try{
      await Supabase.instance.client.from('ToDo').update({'Fatto' : '$state'}).match({'Nome':'$td'});
      FetchToDo();
    }catch(e)
    {
      throw UpdateException("Non è stato possibile modificare i dati all'interno del DB per il seguente motivo: $e");
    }
  }

  ///Funzione per rimuovere un recordo della tabella Evento data la Primary Key
  static Future<void> RemoveToDo(pkToDo) async{
    try{
      await Supabase.instance.client.from('ToDo').delete().match({ 'id': pkToDo });
      FetchToDo();
    }catch(e){
      print("Non è stato possibile eliminare il record dal DB per il seguente motivo: $e");
    }

  }

  ///Inserisce un nuovo record all'interno della tabella degli obiettivi
  static Future<void> InsertObjective(int ore, int minuti, int secondi, int fk) async{
    try{
      await Supabase.instance.client.from('Obiettivo').insert({'Ore': ore, 'Minuti': minuti, 'Secondi': secondi, 'FK_TaskId': fk});
    }catch(e)
    {
      throw InsertException("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
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

class UpdateException extends DatabaseException {
  UpdateException(String message) : super(message);
}

class DeleteException extends DatabaseException {
  DeleteException(String message) : super(message);
}