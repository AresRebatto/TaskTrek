<h1 align="center" style="font-size:28px; line-height:1"><b>Task Trek</b></h1>

<div align="center">
    <img alt="Icon" src="Docimg/HomeIcon.png" width="108px">
</div>


<div align="center">
    <img src="Docimg/Copertina.png"/>
</div>

### Che cos'è l'applicazione?
Si tratta di un'applicazione volta alla gestione del tempo in modo ottimale
grazie a degli strumenti pensati appositamente, prendendo anche spunto, non lo
nascondo, da altre applicazioni simili. <br>
L'idea che ha mosso principalmente l'idea per la nascita del progetto è stata quella
di creare un'applicazione di questo genere, di cui ne esistono già molte, ma rendere
accessibili quelle funzioni che sulle altre applicazioni, di solito, per essere
utilizzate devono essere pagate. 
### UML delle Classi
<img src="Docimg/DiagrammadelleClassi.jpg">
In questo diagramma possiamo osservare le varie classi utilizzate per questo progetto:
è evidente come quella principale che comunica con tutte le altre sia DBApp, ovvero la classe
che ci permette di comunicare con il DataBase in remoto e di effettuare tutte le operazioni 
CRUD sulle varie tabelle. <br>
Di fatto vi sono al suo interno diversi metodo che ci permettono in primis, scaricando i dati dalle
varie tabelle, di avere una lista di istanze delle classi a cui è collegato per permetterci di non accedere
al DataBase ogni volta che si necessita di un semplice dato: di fatto è un'attività che richiede molto tempo
e rallenterebbe notevolmente l'uso dell'applicazione.<br>
quando viene avviata l'applicazione viene richiamato il metodo FetcAll() della classe DBApp che scarica 
immediatamente tutti i dati in locale. <br><br>
Altra classe molto importante è quella delle task, ovvero un'attività di cui vogliamo misurare le tempistiche
che abbiamo per svolgerle ed è quindi collegata a una classe StopWatchTime cui istanze non sono altro che i tempi
registrati e Obiettivo che è il tempo a cui ci prefissiamo di arrivare giornalmente per una singola task. <br><br>
Ci sono poi le classi ToDoTh ed Evento. La prima non serve ad altro se non registrare delle faccende da svolgere da 
inserire una lista come le classiche ToDoList che potete trovare in giro. Evento invece è la classe che si occupa di
registrare i vari eventi che saranno poi visualizzabili nella sezione calendario dell'applicazione.<br><br>
Abbiamo infine le classi per generare le eccezioni in caso di errore per qualche operazione all'interno della classe del
DataBase(Chiaramente le eccezioni sono personalizzate e indirizzate a ogni possibile errore che possa verificarsi nell'interazione)
e la classe Colori che è una semplice classe per la gestione dei colori dell'applicazione: questo consente di avere uno standard e
anche un punto accessibile per cambiare in qualsiasi momento i colori all'applicazione in modo veloce, cosa molto utile nella definizione
di, ad esempio, dei temi.

### UML dei Casi D'uso
<img src="Docimg/DiagrammaDeiCasiDuso.jpg"><br>
All’interno del diagramma dei casi d’uso possiamo trovare quattro casi d’uso principali: Gestione Task, Avviare il timer, Gestione Eventi, Gestione Insights. 
Ognuno di questi a sua volta include o estende altri casi d'uso. Ad esempio “Gestione Task” è un caso incluso tramite l'include ciò significa che fa parte del 
comportamento di quello che lo include. In questo caso “Gestione Task” è incluso nel caso “Visualizzare elenco Task” ciò significa che la gestione 
delle task è totalmente dipendente dal caso d’uso precedentemente elencato. “Visualizzare elenco Task” a sua volta viene esteso tramite l'extend. <br><br>
Prendiamo per esempio in considerazione il caso d’uso “Eliminare Task”, Quest’ultimo è una vera e propria estensione del caso “Visualizzare elenco 
Task” quindi può comportarsi in maniere indipendente. Ciò vale per ogni caso d’uso sopra citato ovvero: Avviare il Timer, Gestione Eventi, Gestione 
Insights. Ogni caso d’uso appunto può possedere delle estensioni o delle inclusioni che ne limitano il libero comportamento, ad esempio “Avviare il 
Timer” include il caso “Aggiungere una attività” perché i due casi sono strettamente collegati e dipendenti l’uno dall’altro, al contrario di ciò il 
caso “Assegnare una Label” è un caso di estensione quindi collegato tramite un extend che porterà i due casi a essere collegati ma il caso “client” 
quindi quello principale che in questo caso è “Avviare il timer” si modera in maniera indipendente dal caso “Assegnare una Label”. Anche il caso “Gestione 
Eventi” viene collegato con un include al caso “Visualizzare calendario Eventi” che a sua volte possiede delle estensioni come il caso “Creare nuovi 
Eventi”, “Eliminare Eventi già creati”, “Modificare Eventi già esistenti”. Infine il caso d’uso “Gestione Insights” include il caso “Visualizzare dati”. 
Per concludere tutti e i quattro casi d’uso principali sono collegati tramite una assegnazione a un attore che in questo caso è chiamato “User”.
### Features
1. ⌚Tenere traccia del tempo di concentrazione e della gestione delle pause.
2. 📅Gestire al meglio i propri impegni con la sezione dedicata del calendario.
3. ✅Fare una lista delle attività giornaliere che ci si propone di portare a compimento nella
sezione apposita dell'app per poter creare la propria personale to-do list.
4. 📈Avere una visione grafica dei propri progressi e della propria costanza grazie alla sezione
delle analytics con i grafici che mostrano il proprio andamento e la propria costanza.
### Dependencies
1. [Table Calendar](https://pub.dev/packages/table_calendar): È stato utilizzato per
creare la grafica e le animazioni del calendario nella pagina dedicata all'interno dell'applicazione.
2. [Supabase Flutter](https://pub.dev/packages/supabase_flutter): È stato
utilizzato per connettere la nostra applicazione a un database basato
su PostgreSQL presente sulla piattaforma Open Source di Cloud Hosting 
di [SupaBase](https://supabase.com/).
3. [FL Charts](https://pub.dev/packages/fl_chart): È stato utilizzato per la 
creazione dei vari grafici nella sezione analytics dell'applicazione, creata appositamente per documentare graficamente 
i propri progressi e il raggiungimento dei propri obiettivi.

### Funzionamento dello Script
Ogni pagina ha al suo interno un Stack utilizzato per la creazione di una Bottom NavBar personalizzata,
la quale a sua volta è stata scritta dentro un file apposito dove si trovano tutti i Widget standard utilizzati
in più pagine come anche l'app bar. <br> <br>
Il codice per la gestione dell'interfaccia è stato gestito nel modo più ordinato il possibile, creando i widget 
esternamente e richiamandoli dentro l'interfaccia stessa in modo da non sovraccaricare eccessivamente il codice 
principale: per eventuali manutenzioni o miglioramenti è la soluzione ottimale. <br> <br>
L'applicazione comunica inoltre con un DataBase in cloud Hosting grazie al servizio Open Source SupaBase. È stata
creata, per questa comunicazione, una classe apposita che di chiama DBApp e che al suo interno ha un metodo per 
inizializzare l'istanza che permette di comunicare con il DataBase e tutte le funzioni per scaricare, caricare, 
eliminare e modificare eventuali record sulle tabelle. Sono state create anche delle classi per generare delle
eccezioni apposite in caso di mal funzionamento, utili soprattutto in fase di scrittura del codice.