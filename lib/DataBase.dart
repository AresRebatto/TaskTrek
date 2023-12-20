import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_trek/Task.dart';

///DataBase class per la connessione al DataBase su supabase
class DBApp{
  //Dati per l'accesso al Db su SupaBase
  static const String _url = "https://uqjxahjhvogsrhyeqely.supabase.co";
  static const String _anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVxanhhaGpodm9nc3JoeWVxZWx5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI0NjcwNjEsImV4cCI6MjAxODA0MzA2MX0.4LKRjA8ObpyqqA5kOUqPa6ife_emx-QckeQdfwKpwpE";
  List<Task>? taskList; //Listya dove si inseriranno le istanze generate grazie ai dati del DB

  ///E' un metodo che va richiamato ogni volta che si vuole usare il Db e serve per aprire
  ///la connessione con esso
  static void Inizialize() async
  {
    try{
      await Supabase.initialize(url: _url, anonKey: _anonKey);
    }catch(e)
    {
      print("Non è stato possibile connettersi al DB per il seguente motivo: $e");
    }

  }
  ///Metodo che inserisce il valore specificato come paramentro come nuovo
  ///record della tabella Task sul DB
  static InsertTask(value) async
  {
    try{
      await Supabase.instance.client.from('Task').insert({'Nome': value});
    }catch(e)
    {
      print("Non è stato possibile scrivere dei dati all'interno del DB per il seguente motivo: $e");
    }

  }

  ///Scarica tutti i record della tabella Task e li carica in una variabile data, grazie
  ///alla quale poi verranno suddivisi e diventeranno membri di una lista di istanze di Task
  static FetchTasks() async{
    try{
      final data = await Supabase.instance.client.from('Task').select();
      print("Ecco i dati contenuti all'interno della tabella: ${data}");
    }catch(e){
      print("Non è stato possibile scaricare i dati dal DB per il seguente motivo: $e");
    }

  }
}