import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_trek/Task.dart';

///DataBase class per la connessione al DataBase su supabase
class DBApp{
  static const String _url = "https://uqjxahjhvogsrhyeqely.supabase.co";
  static const String _anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVxanhhaGpodm9nc3JoeWVxZWx5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI0NjcwNjEsImV4cCI6MjAxODA0MzA2MX0.4LKRjA8ObpyqqA5kOUqPa6ife_emx-QckeQdfwKpwpE";
  List<Task>? taskList;

  static void Inizialize() async
  {
    await Supabase.initialize(url: _url, anonKey: _anonKey);
  }

  static InsertTask(value) async
  {
    await Supabase.instance.client.from('Task').insert({'Nome': value});
  }

  static FetchTasks() async{
    final data = await Supabase.instance.client.from('Task').select();
    print("Ecco i dati contenuti all'interno della tabella: ${data}");
  }


}