import 'package:flutter/material.dart';
import 'package:task_trek/Obiettivo.dart';

class Task
{
  String? _nome;
  Obiettivo? _obiettivo;
  Task(String nome, int taskId, {int? ore, int? minuti, int? secondi})
  {
    if(ore != null && minuti != null && secondi != null)
      _obiettivo = Obiettivo(taskId, ore, minuti, secondi);
    _nome = nome;
  }

  String? get Nome => _nome;
}