<h1 align="center" style="font-size:28px; line-height:1"><b>Task Trek</b></h1>

<div align="center">
    <img alt="Icon" src="Docimg/HomeIcon.png" width="108px">
</div>


<div align="center">
    <img src="Docimg/Copertina.png"/>
</div>

### UML delle Classi
### UML dei Casi D'uso
### Features
### Dependencies
1. [Table Calendar](https://pub.dev/packages/table_calendar): l'abbiamo utilizzato per
creare la grafica e le animazioni del calendario nella pagina dedicata all'interno dell'applicazione.
2. [Supabase Flutter](https://pub.dev/packages/supabase_flutter): l'abbiamo
utilizzato per connettere la nostra applicazione a un database basato
su PostgreSQL presente sulla piattaforma Open Source di Cloud Hosting 
di [SupaBase](https://supabase.com/).
3. [Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts): E' stato utilizzato per la 
creazione dei vari grafici nella sezione analytics dell'applicazione, creata appositamente per documentare graficamente 
i propri progressi e il raggiungimento dei propri obiettivi.

### Funzionamento Script
Ogni pagina ha al suo interno un Stack utilizzato per la creazione di una Bottom NavBar personalizzata,
la quale a sua volta è stata scritta dentro un file apposito dove si trovano tutti i Widget standard utilizzati
in più pagine come anche l'app bar. <br> <br>
Il codice per la gestione dell'interfaccia è stato gestito nel modo più ordinato il possibile, creando i widget 
esternamente e richiamandoli dentro l'interfaccia stessa in modo da non sovraccaricare eccessivamente il codice 
principale: per eventuali manutenzioni o miglioramenti è la soluzione ottimale. <br> <br>
L'applicazione comunica inoltre con un DataBase in cloud Hosting grazie al servizio Open Source SupaBase. E' stata
creata, per questa comunicazione, una classe apposita che di chiama DBApp e che al suo interno ha un metodo per 
inizializzare l'istanza che permette di comunicare con il DataBase e tutte le funzioni per scaricare, caricare, 
eliminare e modificare eventuali record sulle tabelle. Sono state create anche delle classi per generare delle
eccezioni appostie in caso di mal funzionamento, utili soprattutto in fase di scrittura del codice.