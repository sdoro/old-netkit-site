# MySQL-Front Dump 1.20 beta
# $Id: biblio_2_0_beta.sql,v 1.1 2003/10/26 22:17:48 doros Exp $

#
# Host: localhost Database: merlitos
#--------------------------------------------------------
# Server version 3.23.39-nt


#
# Table structure for table 'nuke_biblio_auteurs'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_auteurs (
  id_auteur smallint(10) unsigned NOT NULL auto_increment,
  nom varchar(50) ,
  prenom varchar(50) ,
  naissance varchar(20) NOT NULL DEFAULT '' ,
  mort varchar(20) NOT NULL DEFAULT '' ,
  pays tinyint(6) unsigned NOT NULL DEFAULT '1' ,
  com_vita text ,
  add_date datetime ,
  upd_date datetime ,
  created_by varchar(30) ,
  comments text ,
  PRIMARY KEY (id_auteur)
);


#
# Dumping data for table 'nuke_biblio_auteurs'
#
INSERT INTO nuke_biblio_auteurs VALUES("29","Luciani","Domenica","","","7","Autrice italiana contemporanea vivente. Ha vissuto un po\' di tempo in Germania dove ha scritto romanzi per ragazzi in italiano. In Italia traduce romanzi per ragazzi dal tedesco e continua a scrivere storie divertenti. ","2003-02-10 12:39:12","2003-03-22 10:53:40","Anonimo","Dopo \"Cinema segreto\", vincitore del Premio Bancarellino 1997, ha pubblicato \"Solido, liquido o gassoso?\", \"Andrea & Andrea\" con il fratello Roberto, e ha fatto il bis vincendo il Premio Bancarellino 2000 con \"Vacanze al cimitero\". In biblioteca i suoi libri vanno veramente a ruba!");
INSERT INTO nuke_biblio_auteurs VALUES("28","Gandolfi","Silvana","","","7","E una scrittrice italiana, contemporanea, vivente. E\' nata a Roma, ma trascorre molto tempo a Venezia. E\' molto pigra ed è disposta ad attraversare mari ed oceani per stendersi per alcuni mesi su un\'amaca su un\'isola sperduta! Quando suo figlio Luca era bambino inventava storie per lui in modo da avere un ottimo prestesto per non cucinare o stirare. Ha scritto novelle, romanzi d\'amore, racconti per la radio, ma ora si dedica soprattutto ai libri per bambini. I \"I bambini- dice- sono gli unici a non criticare la mia pigrizia\".","2003-02-10 11:55:13","2003-03-22 10:49:12","Anonimo","E\' una delle più grandi autrici italiane di narrativa per ragazzi. Ha scritto molti romanzi fra cui: La scimmia nella biglia, L\'isola del tempo perso, Occhio di gatto, Pasta di drago, La memoria dell\'acqua (Ed. Gl\'Istrici Salani). ");
INSERT INTO nuke_biblio_auteurs VALUES("24","Pitzorno","Bianca","","","7","Autrice italiana contemporanea, vivente. E\' nata in Sardegna ma da molti anni vive e lavora a Milano. Prima di dedicarsi alla scrittura si  è occupata di archeologia e di teatro ed ha lavorato a lungo in televisione. E\'oggi una delle più popolari autrici di libri per ragazzi del nostro paese, largamente tradotta all\'estero.","2003-02-07 12:03:45","2003-02-07 12:03:45","Anonimo","Tra i suoi romanzi più noti: La casa sull\'albero, La bambola dell\'alchimista, Parlare a vanvera, Ascolta il mio cuore, Principessa Laurentina, Speciale Violante, Diana Cupido e il commendatore, Polissena del porcello. (Ed.Mondadori). Sono libri sono adatti per il 2° ciclo della scuola elementare e per la scuola media.");
INSERT INTO nuke_biblio_auteurs VALUES("26","Findlay","William","","","5","","2003-02-09 11:13:51","2003-02-09 11:13:51","Anonimo","");
INSERT INTO nuke_biblio_auteurs VALUES("27","Dahl","Roald","1916","1990","2","Roald Dahld, nato nel Galles nel 1916, passò infanzia e giovinezza in Inghilterra e a 18 anni andò in Africa a lavorare per una compagnia petrolifera. Durante la seconda guerra mondiale fu pilota della RAF, l\'aviazione militare britannica. Ai suoi quattro figli ha raccontato le storie che poi ha scritto. E\' uno dei più grandi autori di libri di narrativa per ragazzi.","2003-02-10 11:30:52","2003-03-22 10:43:51","Anonimo","Ha scritto molti libri per ragazzi, fra cui i più famosi: Il GGG, Le streghe, Gli Sporcelli, Matilde, La fabbrica di cioccolato, Il grande ascensore di cristallo, Boy, Danny il campione del mondo, James e la pesca gigante (Ed.Gl\'Istrici Salani). ");
INSERT INTO nuke_biblio_auteurs VALUES("25","Falcone Venegoni","Francesco","","","7","","2003-02-09 11:13:22","2003-02-09 11:13:22","Anonimo","");
INSERT INTO nuke_biblio_auteurs VALUES("30","TAMARO","SUSANNA","1957","","7","è nata a Trieste e vive in una fattoria dove, quando non scrive, si occupa dei suoi animali. ha lavorato come documentarista, poi ha deciso di fare la scrittice ed a esordito nel 1989 con il romanzo \"La  testa tra le nuvole\" ( Marsilio ). ","2003-02-10 13:08:54","2003-02-10 13:08:54","Anonimo","E\' un\'autrice molto amata da adulti e  ragazzi. Per gli adulti ha pubblicato, oltre \"La testa tra le nuvole\", il volume di racconti \"Per voce sola\"(Marsilio, 1991) e  il romanzo \"Va\' dove ti porta il cuore\" (Baldini & Castoldi, 1992), che ha riscosso un grande successo e dal quale è stato tratto anche un film. Per i ragazzi: \"Il cerchio magico\", \"Cuore di ciccia\" e \"Tobia e l\'angelo\", editi da Mondadori.");
INSERT INTO nuke_biblio_auteurs VALUES("31","VERNE","GIULIO","1828","1905","1","Nato a Nantes nel 1828, Verne esordì giovanissimo come autore teatrale e librettista dell\'\"Opéra-Comique\", ottenendo discreto successo con il pubblico. La critica, tuttavia, lo considerò \"un buon talento, ma danneggiato dalla troppa fantasia\". Verne decise allora di cambiare genere e scrisse (1863) un lungo racconto \"Cinque settimane in pallone\", a cui seguì il \"Viaggio al centro della terra\" (1864), nei quale diede sfogo a tutto il suo estro. Divenne popolarissimo e i suoi romanzi lo imposero all\'attenzione internazionale. La vita privata dello scrittore trascorse appartata nella piccola città di Nantes.Un solo episodio, misterioso, la turbò : nel 1866 Verne, in circostanze mai chiarite, rimase ferito da un colpo di rivoltella. Si parlò di un attentato e anche di un tentativo di suicidio. Lo scrittore mantenne, a tale riguardo, il riserbo più assoluto.
Verne morì nel 1905 ad Amiens.","2003-02-12 11:36:01","2003-02-12 11:36:01","Anonimo","Verne è considerato uno dei padri della fantascienza, infatti diede l\'inizio, con i suoi libri (Viaggio al centro della terra, Dalla terra alla luna, I figli del capitano Grant, Ventimila leghe sottomare, L\'isola misteriosa...) ad un nuovo genere, quello della romanzo d\'avventura ispirato al progresso scientifico.");
INSERT INTO nuke_biblio_auteurs VALUES("32","PIUMINI","ROBERTO","1947","","7","Autore italiano contemporaneo vivente, nato a Edolo nel 1947,scrive per bambini, ragazzi e adulti: poesie, poemi, filastrocche, fiabe, racconti, romanzi, testi di teatro in prosa e musicale, testi di canzoni. Ha condotto programmi radio, scritto soggetti per il cinema ed è fra gli autori dell\'Albero Azzurro, programmo televisivo per i piccoli. i suoi libri sono tradotti in molti paesi. Con il musicista Giovanni Caviezel ha scritto una grande quantità di canzoni. Con i ragazzi delle scuole sperimenta la composizione di poemi e poesie, i cui materiali di base sono forniti dai ragazzi stessi.","2003-02-12 12:14:57","2003-02-12 12:14:57","Anonimo","Narratore ricco di fantasia, poeta, affabulatore, giocoliere di parole e pensieri, Roberto Piumini è un autore molto amato dai bambini e dai ragazzi. Fra i suoi tanti libri, i più conosciuti: Mattia e il nonno, Lo stralisco, Motu-Iti, Sei posti senza luna, L\'oro del Canoteque, Il sasso del muschio, Un amore di libro, Il circo di Zeus, Il carro a sei ruote.");
INSERT INTO nuke_biblio_auteurs VALUES("33","Milani","Mino","1928","","7","Mino Milani è nato a Pavia nel 1928. Scrittore e giornalista, appassionato di storia, si è laureato in lettere moderne nel 1950 ed ha lavorato al \"Corriere dei piccoli\", sul quale sono stati pubblicati i suoi primi racconti. Ha al suo attivo una trentina di romanzi e una lunga serie di premi prestigiosi.","2003-02-13 09:59:45","2003-03-22 10:56:19","Anonimo","E\' considerato uno dei migliori scrittori italiani contemporanei di libri per ragazzi.  Ha scritto anche per gli adulti, ma il suo rapporto preferenziale è quello con i lettori adolescenti. Quelli di Milani sono libri d\'avventure, spesso a sfondo storico, ma arricchiti da elementi fantastici e leggendari. La sua prima preoccupazione è quella di non annoiare i ragazzi. Uno dei suoi personaggi più celebri è Tommy River, cowboy protagonista di una serie di romanzi e di un fumetto. Fra i suoi romanzi per ragazzi più conosciuti: L\'ultimo lupo, Guglielmo e la moneta d\'oro, L\'uomo venuto dal nulla, La storia di Tristano e Isotta, Le avventure di Tommy River, La storia di Orfeo e Euridice raccontata da Mino Milani.");
INSERT INTO nuke_biblio_auteurs VALUES("34","PEARCE","PHILIPPA","","","2","Scrittrice inglese contemporanea vivente. E\' figlia di un mugnaio ed è nata a pochi chilometri da Cambridge, in una grande casa contornata da un misterioso giardino che poi è diventato il protagonista di \"Il giardino di mezzanotte\". Per vari anni ha curato i programmi del Dipartimento Scolastico della BBC, ha scritto sceneggiature radiofoniche e si è occupata di letteratura infantile. Oggi vive ritirata, a scrivere, nel mulino circondato dallo stesso giardino magico della sua infanzia.","2003-02-13 11:14:27","2003-02-13 11:14:27","Anonimo","E\' da oltre trent\'anni una delle più note autrici inglesi di libri per ragazzi. Ha una vera passione per le storie misteriose, ma è anche capace di descrivere con intelligenza i problemi dell\'adolescenza. Alcuni suoi libri, oltre \"Il giardino di mezzanotte\": Alta marea per un delitto (è un \"giallo\"), La gabbia d\'ombra, Una più del diavolo.");
INSERT INTO nuke_biblio_auteurs VALUES("35","Donghi","Beatrice Solinas","1923","","7","E nata nel 1923 a Serra Ricco, in provincia di Genova, dove attualmente risiede. Laureatasi in lettere, ha iniziato la propria attività letteraria ispirandosi a tematiche familiari e domestiche. L\'esordio è segnato da due volumi di racconti (L\'estate della menzogna, 1959 e Natale non mio, 1961) . Il primo romanzo, \"L\'uomo fedele\" (1965) ha vinto il premio Selezione Campiello. I volumi \"Le fiabe incatenate del 1967 (dal quale è stato tratto un programma televisivo con i pupazzi di Lidia Forlini) e \"La gran fiaba intrecciata\" (1972) hanno portato un efficace apporto al mondo della letteratura per l\'infanzia. Importante è il saggio \"La fiaba come racconto\" (1976), in cui viene esplorato il mondo arcano e suggestivo della fiaba.  La produzione più recente (Quell\'estate al castello,1986; Il fantasma del villino, 1992) è rivolta ai giovani lettori.","2003-02-13 12:01:01","2003-03-22 10:45:14","Anonimo","E\' un\'autrice sensibile e attenta al mondo dell\'adolescenza. Si occupa inoltre di letteratura giovanile con saggi e articoli.
");
INSERT INTO nuke_biblio_auteurs VALUES("36","Ende","Michael","1929","1995","3","E nato a Garmish, in Germania, e dopo una lunga permanenza in Italia, nella sua villa dell\'Unicorno, nei pressi di Roma, ora vive a Monaco. Figlio del pittore surrealista Edgar, le cui opere furono messe al bando dai nazisti come \"arte degenerata\", ed egli stesso autore di affascinanti illustrazioni, Ende è stato attore, regista e critico cinematografico. Autore notissimo in Italia, ha riscosso un grande successo con : La storia infinita, Le avventure di Jim Bottone, La terribile banda dei tredici pirati, La notte dei desideri, Momo. Da \"Momo\" e da \"La storia infinita\" sono stati tratti films omonimi apparsi sugli schermi di moltissimi paesi. nel 1982 ha ottenuto il premio \"Lorenzo il Magnifico\".","2003-02-13 12:51:26","2003-03-04 18:37:31","Anonimo","Nei romanzi di M.Ende  si possono trovare  le più incredibili invenzioni fantastiche e avventure di ogni tipo; è lo scrittore ideale per chi ama la fantasia, l\'avventura, il mistero...insomma per chi ama, leggendo, infrangere le barriere tra mondo della finzione e mondo della realtà!! E\' comunque un autore non di semplice lettura, adatto ai \"grandi lettori\".");
INSERT INTO nuke_biblio_auteurs VALUES("37","PETROSINO","ANGELO","","","7","Angelo Petrosino vive a Chiavasso ed insegna in una scuola elementare di Torino. E\' insegnante da 25 anni e ama molto leggere storie ai suoi alunni. E\' autore di numerosi libri per ragazzi, tra i quali spicca la trilogia di Valentina,  una ragazzina di undici anni che frequenta la prima media e racconta le sue numerosi e divertenti avventure. A \"Le fatiche di Valentina\" sono seguiti molti altri libri, fra cui \"Non arrenderti, Valentina!\", \"Cosa sogni, Valentina\", \"La famiglia di Valentina\" e molti altri (tutti editi da Piemme Junior - Il  Battello a Vapore).","2003-02-15 08:55:44","2003-02-15 08:55:44","Anonimo","I personaggi di Petrosino sono talmente sintonia col mondo dei lettori da essere spesso dei veri e propri punti di riferimento per ragazzi e ragazze. E\' quello che è successo con Valentina, protagonista di una serie molto amata, soprattutto dalle ragazzine dell\'ultimo anno della scuola elementare e della prima e seconda media, che si identificano in questo simpatico personaggio.");
INSERT INTO nuke_biblio_auteurs VALUES("38","Lively","Penelope","","","2","E nata in Egitto, da genitori inglesi, e là trascorre la sua infanzia. All\'età di dodici anni si trasferisce in Inghilterra dove, per i primi tempi, si sente sradicata da tutto quello che aveva caratterizzato i suoi primi anni di vita e per cui manterrà sempre una speciale affezione. Completa gli studi a Oxford, dove consegue la laurea in Storia che le permetterà di svolgere per un certo periodo la professione di insegnante. All\'inizio della sua carriera di scrittrice si dedica indifferentemente alla stesura di libri per ragazzi e per adulti. Attualmente le sue creazioni sono unicamente per gli adulti. il suo romanzo Moon Tiger Ha vinto nel 1987 il prestigioso Booker Prize . ","2003-02-15 10:56:35","2003-03-22 10:52:38","Anonimo","Fra i suoi romanzi per  ragazzi sono da segnalare: \"Un viaggio indimenticabile\"  e \"La casa dal grande giardino\", editi da Mondadori, adatti per la scuola media.");
INSERT INTO nuke_biblio_auteurs VALUES("39","PENNAC","DANIEL","1944","","1","Pennac, autore contemporaneo francese,  vive a Parigi e abita da vent\'anni nello stesso quartiere, Belleville, pieno di cani e personaggi curiosi. Insegna ai ragazzi difficili, è sposato e ha una bambina, Alice. Oltre che di libri per bambini (Io e Kamo, Abbaiare stanca...) è autore di quattro romanzi, tutti centrati sulla figura di Benjamin Malaussène: Il paradiso degli orchi, La fata carabina, La prosivendola, signor Malaussène (Feltrinelli). Ha scritto anche un importante saggio sulla lettura, \"Come un romanzo\"(1992), dove affronta in maniera intelligente e spassosa  il problema di come si possa stimolare i giovani al piacere di leggere.","2003-02-15 11:23:00","2003-02-15 11:23:00","Anonimo","E\' un autore amatissimo anche dal pubblico italiano e i suoi libri sono un tale misto di fiaba tenera e grottesca e di romanzo nero che piacciono ad adulti e  ragazzi.");
INSERT INTO nuke_biblio_auteurs VALUES("40","STINE","Robert Lawrence","","","5","Ha iniziato la sua carriere di scrittore a nove anni, scrivendo racconti per gli amici. E\' stato redattore capo di una rivista umoristica per ragazzi, quindi ha creato la serie \"Goosebumps\" (Piccoli Brividi) che ha venduto 450 milioni di copie in tutto il mondo. Vive a Manhattan con la moglie Jane, il figlio Matthew e il cane Nadine.","2003-02-15 12:14:18","2003-02-15 12:14:18","Anonimo","E\' conosciuto soprattutto per la serie \"Piccoli Brividi\" (piccoli \"horror\" per ragazzi), che ha avuto un grande successo in tutto il mondo. Sono adatti  a partire dai 10/11 anni.");
INSERT INTO nuke_biblio_auteurs VALUES("41","PAULSEN","GARY","1939","","5","Nato nel Minnesota (USA), vive in un ranch del Nuovo Messico. Ha scritto molti libri per ragazzi (Oltre il confine, Il figlio dei ghiacci, L\'uomo delle volpi, Il mio amico Harold...), ma anche alcuni libri per adulti in cui racconta la sua difficile infanzia e le molte avventure vissute tra le nevi dell\'Alaska.","2003-02-17 12:43:22","2003-02-17 12:43:22","Anonimo","Amante dell\'avventura, è uno dei più famosi scrittori americani per ragazzi. Il suo successo è testimoniato dai numerosi riconoscimenti ottenuti, tra cui il Newbery Honor Book Award.");
INSERT INTO nuke_biblio_auteurs VALUES("42","Maldini","Giuliana","","","7","Scrittrice italiana contemporanea vivente. E\' nata a Alessandria e vive e lavora a Milano dove fa la pittrice e la disegnatrice umoristica. E\' autrice di libri di satira di costume e le sue tematiche predilette ruotano intorno al mondo femminile e alla vita di coppia (\"Panni sporchi\", \"Femminiglia\"). E\' una delle prime donne in Italia ad aver pubblicato un libro di vignette dal titolo \" Qui regna l\'amore\", che è un\'analisi tragicocomica sulla condizione femminile. Collabora con periodici di vario genere ed è fermamente convinta che uno dei valori più seri della vita sia l\'umorismo.","2003-02-17 12:58:45","2003-03-22 10:55:08","Anonimo","I suoi libri per ragazzi \"La mia seconda prima\" e \"Io e mia sorella\", editi da E.Elle, piacciono particolarmente alle ragazzine di prima media, che si identificano nella protagonista, Cecilia, una ragazzina come loro.");
INSERT INTO nuke_biblio_auteurs VALUES("43","ROWLING","J.K.","","","2","Inglese, vive a Edimburgo con la figlia. Con le avventure di Harry Potter  ( Harry Potter e : la pietra filosofale, la camera dei segreti, il prigioniero di Azkaban, il calice di fuoco) è diventata l\'autrice per ragazzi più famosa del mondo, pubblicata in 35 paesi e premiata con i più prestigiosi riconoscimenti internazionali. I suoi libri sono stabilmente in testa alle classifiche dei bestseller europee e americane. ","2003-02-19 09:52:26","2003-02-19 09:52:26","Anonimo","Su \"Repubblica\" : \"Arriva Potter e leggere è come volare\"; sul \"Corriere della sera \"...parla di cose importanti in modo semplice, che coinvolge ma non turba, che spaventa e rassicura insieme e che molto spesso fa ridere.\" 
Per chi ama soprattutto il genere fantastico.");
INSERT INTO nuke_biblio_auteurs VALUES("44","Milne","Alan Alexander","1882","1956","2","Alan Alexander Milne (A.A. per gli amici) è nato a Londra nel 1882; è stato giornalista, romanziere, poeta e commediografo. Ha scritto 33 commedie, 12 romanzi e, per un certo periodo, è vissuto raccogliendo gli errori dei giornali e pubblicandoli sul suo. Ma è diventato un famoso autore per ragazzi grazie all\'orso Winnie Puh e ai suoi amici, i personaggi delle storie fantastiche che Milne raccontava, usando dei pupazzi, a suo figlio, Christopher Robin. Milne è morto nel 1956. Suo figlio, che ha ispirato i suoi libri e che è stato il bambino più famoso del mondo, invece  è ancora vivo.","2003-02-24 09:44:12","2003-03-22 10:59:51","Anonimo","A.A.Milne è diventato uno degli scrittori più letti e famosi del mondo grazie a \"Winnie Puh\" e \"La strada di Puh\", che sono stati tradotti in 31 lingue, compreso il latino e l\'esperanto. Le avventure dell\'orsetto Winnie Puh e dei suoi amici (il coniglio, l\'asino, il gufo, il porcellino...) , raccontate con maestria e umorismo dall\'autore,  appassionano, coinvolgono e divertono il lettore.");
INSERT INTO nuke_biblio_auteurs VALUES("45","Gaarder","Jostein","1952","","21","Jostein Gaarder è nato nel 1952 in Norvegia, a Oslo, dove ora vive con la moglie e due figli. Dopo aver studiato filosofia, telogia e letteratura, ha insegnato filosofia per dieci anni. Ha esordito come scrittore nel 1986 e ben presto è diventato uno degli autori più noti del suo  paese. E\' con \"Il mondo di Sophia\"  che ha raggiunto il successo internazionale(1991). In seguito ha confermato di essere uno degli scrittori più amati con \"L\'enigma del solitario\", \"Il viaggio di Elisabet\",\"Maya\", ed ora con \"Il venditore di storie\", tutti pubblicati da Longanesi. Presso Salani sono apparsi  invece \"C\'è nessuno? e \"Cosa c\'è dietro le stelle\".","2003-02-24 10:28:13","2003-03-22 10:47:11","Anonimo","Le intriganti storie di quest\'autore norvegese ci guidano lungo il fragile confine tra mondo reale e mondo fantastico. Da \"L\'Avvenire\":
\"I libri di Jostein Gaarder fanno sempre pensare, perché si basano sulle grandi domande esistenziali che i lettori di tutte le età prima o poi si trovano a formulare.\"");
INSERT INTO nuke_biblio_auteurs VALUES("46","TOLKIEN","John Ronald Reuel","3 gennaio 1892","2 settembre 1973","2","Nato nel 1892 a Bloemfontein, nel Sudafrica, J.R.R.Tolkien ha occupato la cattedra di lingua e letteratura anglosassone all\'Università di Leeds (dal 1920 al 1925) e poi ad Oxford (dal 1925 al 1945), dove successivamente insegnò lingua e letteratura inglese fino al 1959, anno in cui si ritirò dall\'attività didattica. Ha anche partecipato alla compilazione dell\'Oxford English Dictionary. Benché fosse conosciuto ben presto come una delle maggiori autorità mondiali in campo filologico, Tolkien deve la sua fama soprattutto alle sue opere di narrativa, e in particolare a \"Lo Hobbit\" e \"Il Signore degli Anelli\" (1954-55). E\' morto a Oxford nel 1973.","2003-02-24 12:48:52","2003-02-24 12:48:52","Anonimo","J.R.R.Tolkien è stata una delle figure più prestigiose del mondo culturale inglese contemporaneo. La trilogia \"Il Signore degli Anelli\" ha avuto uno straordinario successo presso le nuove generazioni per l\'accesa fantasia, l\'eccezionale potenza narrativa, la sua polemica contro l\'industrialismo. ");
INSERT INTO nuke_biblio_auteurs VALUES("47","UMANSKY","KAYE","1946","","2","E\' nata nel 1946 e vive a Londra; prima di fare la scrittrice ha studiato recitazione, insegnato musica e lavorato per il cinema e la televisione. I suoi libri per bambini hanno ottenuto un notevole successo in tutto il mondo.","2003-02-25 10:04:14","2003-02-25 10:04:14","Anonimo","I suoi libri della serie \"Puzzy la strega\" hanno riscosso un notevole successo: la protagonista è Puzzy, la strega sudiciona, che ne combina di tutti i colori...
Sono libri adatti a partire dagli 8 anni.");


#
# Table structure for table 'nuke_biblio_comments'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_comments (
  id smallint(5) unsigned NOT NULL auto_increment,
  name text NOT NULL DEFAULT '' ,
  country text NOT NULL DEFAULT '' ,
  city text NOT NULL DEFAULT '' ,
  email text NOT NULL DEFAULT '' ,
  url text ,
  icq int(11) ,
  message text NOT NULL DEFAULT '' ,
  manner char(3) ,
  post_time datetime DEFAULT '0000-00-00 00:00:00' ,
  reply text ,
  id_livre tinyint(3) unsigned ,
  PRIMARY KEY (id),
  UNIQUE id (id)
);


#
# Dumping data for table 'nuke_biblio_comments'
#
INSERT INTO nuke_biblio_comments VALUES("1","Merlo Umberto","italia","Villar Perosa","webmaster@merlitos.com","http://merlitos.zetab.com",NULL,"Libro da leggere! Imperidibile!","008","2003-03-27 09:04:10",NULL,"57");


#
# Table structure for table 'nuke_biblio_genres'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_genres (
  id_genre tinyint(5) unsigned NOT NULL auto_increment,
  nom varchar(50) ,
  PRIMARY KEY (id_genre)
);


#
# Dumping data for table 'nuke_biblio_genres'
#
INSERT INTO nuke_biblio_genres VALUES("1","Romanzi");
INSERT INTO nuke_biblio_genres VALUES("2","Poesia");
INSERT INTO nuke_biblio_genres VALUES("3","Teatro");
INSERT INTO nuke_biblio_genres VALUES("4","Autobiografia");
INSERT INTO nuke_biblio_genres VALUES("5","Biografia");
INSERT INTO nuke_biblio_genres VALUES("6","Soap Opera");
INSERT INTO nuke_biblio_genres VALUES("7","Critica");
INSERT INTO nuke_biblio_genres VALUES("8","Libro di letteratura");
INSERT INTO nuke_biblio_genres VALUES("9","Scienze delle comunicazioni");
INSERT INTO nuke_biblio_genres VALUES("10","Informatica");
INSERT INTO nuke_biblio_genres VALUES("11","Filosopia");
INSERT INTO nuke_biblio_genres VALUES("12","Arte");
INSERT INTO nuke_biblio_genres VALUES("13","Scienza");
INSERT INTO nuke_biblio_genres VALUES("14","Testi Sacri");
INSERT INTO nuke_biblio_genres VALUES("15","Manuali Traduzione");
INSERT INTO nuke_biblio_genres VALUES("16","Manuali Cucina");
INSERT INTO nuke_biblio_genres VALUES("17","Dizionario");
INSERT INTO nuke_biblio_genres VALUES("18","Piacere");
INSERT INTO nuke_biblio_genres VALUES("19","Manuali");
INSERT INTO nuke_biblio_genres VALUES("20","Storia");
INSERT INTO nuke_biblio_genres VALUES("21","Antologia");
INSERT INTO nuke_biblio_genres VALUES("22","Economia e Politica");
INSERT INTO nuke_biblio_genres VALUES("23","Pedagogia e Educazione");
INSERT INTO nuke_biblio_genres VALUES("24","Psicologia");
INSERT INTO nuke_biblio_genres VALUES("25","Sociologia");
INSERT INTO nuke_biblio_genres VALUES("26","Metodica Letteraria");
INSERT INTO nuke_biblio_genres VALUES("27","Spiritualità");
INSERT INTO nuke_biblio_genres VALUES("28","Nuove Tecnologie");
INSERT INTO nuke_biblio_genres VALUES("29","Novelle");
INSERT INTO nuke_biblio_genres VALUES("30","Manuali Infomatica");
INSERT INTO nuke_biblio_genres VALUES("31","Manuali Meccanica");
INSERT INTO nuke_biblio_genres VALUES("32","Medicina");
INSERT INTO nuke_biblio_genres VALUES("33","Mitologia");
INSERT INTO nuke_biblio_genres VALUES("34","Storia Medioevale");
INSERT INTO nuke_biblio_genres VALUES("35","Storia Moterna");
INSERT INTO nuke_biblio_genres VALUES("36","Storia Orientale");
INSERT INTO nuke_biblio_genres VALUES("37","Animali");
INSERT INTO nuke_biblio_genres VALUES("38","Manuali Allevamento");
INSERT INTO nuke_biblio_genres VALUES("39","Manuali Economia");
INSERT INTO nuke_biblio_genres VALUES("40","Musica");
INSERT INTO nuke_biblio_genres VALUES("41","Storia Contemporanea");
INSERT INTO nuke_biblio_genres VALUES("42","Politica");
INSERT INTO nuke_biblio_genres VALUES("43","Manuali Cinema");
INSERT INTO nuke_biblio_genres VALUES("44","Cultura Orientale");
INSERT INTO nuke_biblio_genres VALUES("45","Geografia");
INSERT INTO nuke_biblio_genres VALUES("46","Culinaria");
INSERT INTO nuke_biblio_genres VALUES("47","Erotico");
INSERT INTO nuke_biblio_genres VALUES("48","Erotismo");
INSERT INTO nuke_biblio_genres VALUES("49","Sadomasochismo");
INSERT INTO nuke_biblio_genres VALUES("50","Religione");


#
# Table structure for table 'nuke_biblio_kinds'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_kinds (
  id_genre tinyint(5) unsigned NOT NULL auto_increment,
  nom varchar(50) ,
  PRIMARY KEY (id_genre)
);


#
# Dumping data for table 'nuke_biblio_kinds'
#


#
# Table structure for table 'nuke_biblio_langues'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_langues (
  id_langue tinyint(6) unsigned NOT NULL auto_increment,
  nom varchar(50) ,
  PRIMARY KEY (id_langue)
);


#
# Dumping data for table 'nuke_biblio_langues'
#
INSERT INTO nuke_biblio_langues VALUES("1","Francese");
INSERT INTO nuke_biblio_langues VALUES("2","Inglese");
INSERT INTO nuke_biblio_langues VALUES("3","Tedesco");
INSERT INTO nuke_biblio_langues VALUES("4","Spagnolo");
INSERT INTO nuke_biblio_langues VALUES("5","Russo");
INSERT INTO nuke_biblio_langues VALUES("6","Italiano");
INSERT INTO nuke_biblio_langues VALUES("7","Portoghese");
INSERT INTO nuke_biblio_langues VALUES("8","Norvegese");


#
# Table structure for table 'nuke_biblio_livres'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_livres (
  id_livre smallint(12) unsigned NOT NULL auto_increment,
  auteur smallint(10) unsigned NOT NULL DEFAULT '0' ,
  titre varchar(100) ,
  soustitre varchar(50) ,
  genre tinyint(5) unsigned NOT NULL DEFAULT '1' ,
  langue tinyint(5) unsigned NOT NULL DEFAULT '1' ,
  parution varchar(20) ,
  lieu varchar(50) ,
  edition varchar(50) ,
  collection varchar(50) ,
  date_edition varchar(50) ,
  traducteur varchar(50) ,
  pages smallint(12) unsigned ,
  date_achat varchar(50) ,
  commentaires varchar(200) ,
  cod_int varchar(10) ,
  add_date datetime ,
  upd_date datetime ,
  created_by varchar(30) ,
  cod_isbn varchar(15) ,
  count_view int(20) ,
  PRIMARY KEY (id_livre)
);


#
# Dumping data for table 'nuke_biblio_livres'
#
INSERT INTO nuke_biblio_livres VALUES("45","30","Cuore di ciccia","","1","6","1992","Milano","Mondadori","Junior -10","","","100","","","853.9 (244","2003-02-18 11:02:20","2003-03-05 12:12:26",NULL,"88-04-43688-3","2");
INSERT INTO nuke_biblio_livres VALUES("44","42","La mia seconda prima","","1","6","1994","Trieste","E.Elle","Le Letture","","","98","","","853.9","2003-02-17 13:06:10","2003-03-07 12:09:17",NULL,"88-7068-691-4",NULL);
INSERT INTO nuke_biblio_livres VALUES("43","41","Il figlio dei ghiacci","","1","2","1994","Milano","A.Mondadori","Miti Junior","","","152","","","813","2003-02-17 12:50:34","2003-03-05 12:21:06",NULL,"88-04-43304-3",NULL);
INSERT INTO nuke_biblio_livres VALUES("42","27","La fabbrica di cioccolato","","1","2","1994","Milano","Salani","Gl\'Istrici","","Riccardo Duranti","202","","","823.9  ((3","2003-02-17 12:32:58","2003-03-07 11:57:51",NULL,"88-7782-344-5",NULL);
INSERT INTO nuke_biblio_livres VALUES("40","39","Abbaiare stanca","","1","1","1993","Firenze","Salani","Gl\'Istrici","","Cristina Palomba","190","","","843.9   (1","2003-02-15 11:33:45","2003-03-06 08:32:26",NULL,"88-7782-275-9","2");
INSERT INTO nuke_biblio_livres VALUES("41","40","L\'ora degli incubi","","1","2","2001","Milano","Mondadori","Junior Horror","","Matilde Macaluso","133","","","813.9    (","2003-02-15 12:22:34","2003-03-07 11:51:08",NULL,"88-04-49175-2",NULL);
INSERT INTO nuke_biblio_livres VALUES("38","37","Cosa sogni,Valentina?","","1","6","1988","Casale Monferrato","Piemme Junior","Il Battello a Vapore - Serie Arancio","","","199","","","853.9 (326","2003-02-15 09:06:44","2003-03-05 12:08:09",NULL,"88-384-3639-8",NULL);
INSERT INTO nuke_biblio_livres VALUES("39","38","Un viaggio indimenticabile","","1","2","1992","Milano","Mondadori","Contemporanea","","Mariapia Chiodi","117","","","823.9","2003-02-15 11:05:03","2003-03-21 12:00:37",NULL,"88-04-36310-X",NULL);
INSERT INTO nuke_biblio_livres VALUES("46","24","La casa sull\'albero","","1","6","1990","Milano","Arnoldo Mondadori","Junior -10","","","101","","","853.9 (282","2003-02-18 11:09:58","2003-03-07 11:54:19",NULL,"88-04-44479-7",NULL);
INSERT INTO nuke_biblio_livres VALUES("47","24","La voce segreta","","1","6","1998","Milano","Arnoldo Mondadori","Junior -10","","","183","","","853.9 (278","2003-02-18 11:25:24","2003-03-21 11:50:24",NULL,"88-04-47030-5","1");
INSERT INTO nuke_biblio_livres VALUES("36","35","Quell\'estate al castello","","1","6","1986","Trieste","E.Elle","Le Letture","","","168","","","853.9","2003-02-13 12:15:45","2003-03-21 11:59:22",NULL,"88-7068-073-8","1");
INSERT INTO nuke_biblio_livres VALUES("37","36","Momo","","1","3","1981","Torino","SEI","","","Daria Angeleri","252","","","833.9","2003-02-15 08:39:21","2003-03-21 11:55:49",NULL,"88-05-05279-5",NULL);
INSERT INTO nuke_biblio_livres VALUES("35","34","Il giardino di mezzanotte","","1","2","1993","Firenze","Salani","Gl\'Istrici","2000","Annamaria Levi","249","","","823.9   (3","2003-02-13 11:35:17","2003-03-05 12:27:09",NULL,"88-7782-014-4","4");
INSERT INTO nuke_biblio_livres VALUES("34","33","L\'ultimo lupo","","1","6","1993","Casale Monferrato","Piemme","Il Battello A Vapore / Serie rossa","","","147","","","853.9","2003-02-13 10:09:45","2003-03-07 11:53:22",NULL,"88-384-3711-4",NULL);
INSERT INTO nuke_biblio_livres VALUES("33","32","Lo stralisco","","1","6","1987","Torino","Einaudi","","","","82","","","853.9","2003-02-12 12:22:58","2003-03-21 11:54:37",NULL,"88-06-59905-4","1");
INSERT INTO nuke_biblio_livres VALUES("32","31","Il giro del mondo in 80 giorni","","1","1","2000","Milano","Fabbri","I Delfini - Classici","2000","Augusto Donaudy","308","","","843.8    (","2003-02-12 11:54:07","2003-03-07 11:49:10",NULL,"88-451-7631-2",NULL);
INSERT INTO nuke_biblio_livres VALUES("31","29","Vacanze al cimitero","","1","6","1999","Firenze","Giunti","Supergru 11/13 anni","2000","","254","","","853.9   (2","2003-02-10 12:53:58","2003-03-21 12:01:40",NULL,"88-09-01819-2",NULL);
INSERT INTO nuke_biblio_livres VALUES("30","28","L\'isola del tempo perso","","1","6","1997","Firenze","Salani","Gl\'Istrici","1998","","245","","","853.9    (","2003-02-10 12:19:19","2003-03-07 11:50:18",NULL,"88-7782-486-7",NULL);
INSERT INTO nuke_biblio_livres VALUES("28","27","Le streghe","","1","2","1983","Firenze","Salani","Gl\'Istrici","1992","Francesca Lazzarato, Lorenza Manzi","195","","","823    (17","2003-02-10 11:40:47","2003-03-21 11:52:14",NULL,"88-7782-005-5","1");
INSERT INTO nuke_biblio_livres VALUES("29","28","La scimmia nella biglia","","1","6","1992","Torino","Salani -Tea Scuola","Gl\'Istrici","1995","","210","","","853.9","2003-02-10 12:09:22","2003-03-07 12:12:25",NULL,"88-696-2006-9","1");
INSERT INTO nuke_biblio_livres VALUES("27","25","Lavoro al Computer","","28","6","2001","Milano","Ghisetti & Corvi","","","","192","2002","","003","2003-02-09 11:20:57","2003-02-09 11:20:57",NULL,"",NULL);
INSERT INTO nuke_biblio_livres VALUES("26","26","Introduzione al Pascal","Metodo, programmi ed esercizi","30","6","1983","","","","","","302","","","???","2003-02-09 11:18:22","2003-03-04 18:19:40",NULL,"","1");
INSERT INTO nuke_biblio_livres VALUES("25","24","Clorofilla dal cielo blu","","1","6","1975","Milano","Mondadori","Junior -10","1991","","163","","","853.9","2003-02-07 12:15:51","2003-02-07 12:15:51",NULL,"88-04-34478-4","9");
INSERT INTO nuke_biblio_livres VALUES("48","37","Le fatiche di Valentina","","1","6","1995","Casale Monferrato","Piemme Junior","Il Battello a Vapore - Serie Arancio","","","175","","","853.9 (189","2003-02-18 11:34:50","2003-03-21 11:51:18",NULL,"88-384-3616-9",NULL);
INSERT INTO nuke_biblio_livres VALUES("49","41","Oltre il confine","","1","2","1997","Milano","A.Mondadori","Junio +10","","Chiara Arnone","91","","","813.9 (289","2003-02-18 12:55:14","2003-03-21 11:56:50",NULL,"88-04-43517-8",NULL);
INSERT INTO nuke_biblio_livres VALUES("50","43","Harry Potter e la camera dei segreti","","1","2","1999","Milano","Salani","","","Marina Astrologo","309","","","823.9  (28","2003-02-19 10:00:49","2003-03-05 12:15:23",NULL,"88-7782-703-3",NULL);
INSERT INTO nuke_biblio_livres VALUES("51","36","La notte dei desideri","ovvero il satanarchibugiardinfernalcolico Grog Di","1","3","1990","Firenze","Salani","Gl\'Istrici","","Elisabetta Dell\'Anna Ciancia","253","","","833.9","2003-02-21 09:40:24","2003-03-07 12:10:52",NULL,"88-7782-405-0","1");
INSERT INTO nuke_biblio_livres VALUES("52","43","Harry Potter e il prigioniero di Azkaban","","1","1","2000","Milano","Salani","","","Beatrice Masini","368","","","823.9 (272","2003-02-24 09:08:21","2003-03-05 12:14:04",NULL,"88-7782-852-8",NULL);
INSERT INTO nuke_biblio_livres VALUES("53","44","La strada di Puh","","1","2","1993","Firenze","Salani","Gl\'Istrici Classici","","Luigi Spagnol","181","","","823.9 (241","2003-02-24 10:06:50","2003-03-21 11:49:22",NULL,"88-7782-279-1",NULL);
INSERT INTO nuke_biblio_livres VALUES("54","45","C\'è nessuno?","","1","8","1997","Firenze","Salani","","","Eva Kampmann","116","","","839","2003-02-24 10:55:54","2003-03-05 12:10:22",NULL,"88-7782-545-6","3");
INSERT INTO nuke_biblio_livres VALUES("55","43","Harry Potter e la pietra filosofale","","1","2","1998","Firenze","Salani","","","Marina Astrologo","296","","","823.9 (283","2003-02-24 11:30:04","2003-03-05 12:16:49",NULL,"88-7782-702-5","6");
INSERT INTO nuke_biblio_livres VALUES("56","46","Lo hobbit","o la riconquista del tesoro","1","2","1980","Milano","Euroclub","","","Elena Jeronimidis Conte","342","","","823.9","2003-02-24 13:07:12","2003-03-21 11:53:10",NULL,"","3");
INSERT INTO nuke_biblio_livres VALUES("57","47","Puzzy a Tontolandia","","1","2","1999","Milano","A.Mondadori","Junior   -10","","Nicoletta Zapponi","190","","","823.9   (2","2003-02-25 10:14:23","2003-03-21 11:58:08",NULL,"88-04-46576-X","7");
INSERT INTO nuke_biblio_livres VALUES("58","35","Il fantasma del villino","","1","6","1994","Milano","Einaudi","Einaudi Scuola","","","0","171","","853.9","2003-02-26 12:28:08","2003-03-05 12:17:50",NULL,"88-286-0188-4","4");
INSERT INTO nuke_biblio_livres VALUES("59","24","Streghetta mia","","1","6","1995","Trieste","Enaudi","Enaudi Ragazzi","","","114","","","853.9 (234","2003-03-17 12:29:22","2003-03-17 12:29:22",NULL,"88-7926-196-7",NULL);
INSERT INTO nuke_biblio_livres VALUES("60","24","Extraterrestre alla pari","","1","6","1990","Milano","Edizioni Scolastiche Bruno Mondadori","","","","205","","","853.9","2003-03-22 10:34:49","2003-03-22 10:34:49",NULL,"88-424-0129-3",NULL);
INSERT INTO nuke_biblio_livres VALUES("61","28","La memoria dell\'acqua","","1","6","1999","Milano","Salani","Gl\'Istrici","","","260","","","853.9","2003-03-22 10:42:24","2003-03-22 10:42:24",NULL,"88-7782-644-4",NULL);


#
# Table structure for table 'nuke_biblio_pays'
#

CREATE TABLE /*!32300 IF NOT EXISTS*/ nuke_biblio_pays (
  id_pays tinyint(6) unsigned NOT NULL auto_increment,
  nom varchar(50) ,
  PRIMARY KEY (id_pays)
);


#
# Dumping data for table 'nuke_biblio_pays'
#
INSERT INTO nuke_biblio_pays VALUES("1","Francia");
INSERT INTO nuke_biblio_pays VALUES("2","Inghilterra");
INSERT INTO nuke_biblio_pays VALUES("3","Germania");
INSERT INTO nuke_biblio_pays VALUES("4","Spagna");
INSERT INTO nuke_biblio_pays VALUES("5","Stati Uniti");
INSERT INTO nuke_biblio_pays VALUES("6","Russia");
INSERT INTO nuke_biblio_pays VALUES("7","Italia");
INSERT INTO nuke_biblio_pays VALUES("8","India");
INSERT INTO nuke_biblio_pays VALUES("9","Svizzera");
INSERT INTO nuke_biblio_pays VALUES("10","Belgio");
INSERT INTO nuke_biblio_pays VALUES("11","Irlande");
INSERT INTO nuke_biblio_pays VALUES("12","Grecia");
INSERT INTO nuke_biblio_pays VALUES("13","Romania");
INSERT INTO nuke_biblio_pays VALUES("14","Grecia Antica");
INSERT INTO nuke_biblio_pays VALUES("15","Roma Antica");
INSERT INTO nuke_biblio_pays VALUES("16","Pologna");
INSERT INTO nuke_biblio_pays VALUES("17","Cina");
INSERT INTO nuke_biblio_pays VALUES("18","Libano");
INSERT INTO nuke_biblio_pays VALUES("19","Egitto");
INSERT INTO nuke_biblio_pays VALUES("20","Svezia");
INSERT INTO nuke_biblio_pays VALUES("21","Norvegia");
INSERT INTO nuke_biblio_pays VALUES("22","Danimarca");
INSERT INTO nuke_biblio_pays VALUES("23","Turchia");
INSERT INTO nuke_biblio_pays VALUES("24","Brasile");
INSERT INTO nuke_biblio_pays VALUES("25","Colombia");
INSERT INTO nuke_biblio_pays VALUES("26","Venezuela");
