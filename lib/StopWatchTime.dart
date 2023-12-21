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
  void avviaTempo(int taskId) {
    attivo = true;
  }

  void mettiInPausa() {
    attivo = false;
  }

  void bloccaTempo() {
    attivo = false;
    print("Il tempo si è fermato e i dati sono stati salvati nel database");
  }
}