import 'package:flutter/material.dart';

class Task
{
  String? _nome;

  Task(String nome)
  {
    _nome = nome;
  }

  String? get Nome => _nome;
}