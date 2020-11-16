
#-------------------------Comune-----------------------------

insert into Comune(Città)
values("Napoli");

insert into Comune(Città)
values("Milano");

insert into Comune(Città)
values("Londra");


#-------------------------Società----------------------------

insert into Società(Nome, AnnoFondazione)
values("Barcellona FC", 1899);


insert into Società(Nome, AnnoFondazione)
values("Juventus FC", 1897);


#------------------------------Stadio----------------------
insert into Comune(città, CCodiceID) values("",-1);
insert into Società(Nome, SCodiceID, AnnoFondazione) values("", -1, 0);
insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("San Paolo", "Italia", "Napoli", "via Claudio", "54 726", "Lo stadio San Paolo, già del Sole, è il principale impianto polisportivo della città di Napoli. Di proprietà del Comune di Napoli, è situato a Fuorigrotta, quartiere della X Municipalità. Dotato di palestre polifunzionali, spazi per le arti marziali e di un campo da pallacanestro, è conosciuto soprattutto dal punto di vista calcistico, essendo sede degli incontri interni della squadra del Napoli.
Esempio di architettura brutalista, gli accorgimenti adottati in fase di progettazione lo resero, alla sua inaugurazione, tra gli stadi più apprezzati del panorama internazionale dell'epoca; la ricercatezza dello stile originario ha indotto diversi tecnici a chiederne l'inserimento tra i beni paesaggistici vincolati dal Ministero dei Beni Culturali. Costruito tra il 1952 e il 1959 sulla base del progetto del gruppo diretto dall'architetto Carlo Cocchia, vincitore del concorso nazionale indetto appositamente nel 1948, è il quarto stadio in Italia e il quarantatreesimo in Europa per capienza omologata.
Incluso tra le sedi di due edizioni dei campionati europei e di un'edizione dei campionati mondiali di calcio, è uno dei quattro stadi al mondo, al pari dello stadio Olimpico di Tokyo, dello stadio Olimpico Universitario di Città del Messico e dello stadio dei Lavoratori di Pechino, ad aver ospitato un evento sportivo di almeno un'edizione dei Giochi Olimpici, delle Universiadi e della manifestazione multidisciplinare locale — nel caso del San Paolo, i Giochi del Mediterraneo.", 1, -1);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("San Siro", "Italia", "Milano", "via dei piccolomini", "75923", "Lo stadio Giuseppe Meazza è un impianto calcistico italiano di proprietà del comune di Milano, che ospita le gare interne del Milan e dell'Inter.In ragione del quartiere dove sorge, è noto anche come stadio San Siro, nome che ebbe ufficialmente dal giorno dell'inaugurazione — il 19 settembre 1926 — fino al 3 marzo 1980, quando fu intitolato a Giuseppe Meazza, calciatore di entrambe le società ospiti dello stadio, venuto a mancare l'anno prima. Soprannominato la Scala del calcio o il tempio del calcio, è uno degli stadi più conosciuti a livello internazionale, oltre a essere il più capiente d'Italia, potendo ospitare 75 923 spettatori. Nel 2009 fu giudicato dal quotidiano britannico The Times il secondo stadio più bello del mondo e, secondo un'analisi condotta da Camera di commercio e Università degli Studi di Milano nel 2014, il Meazza è uno dei simboli più identificativi della città dopo il Duomo e la Triennale.
Con i torinesi Allianz Stadium e Olimpico Grande Torino e il romano Olimpico fa parte del gruppo di quattro stadi italiani a rientrare nella Categoria 4 UEFA, quella con maggior livello tecnico.", 2, -1);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Allianz Stadium", "Italia", "Torino", "via corso Gaetano Scirea", "41507", "L'Allianz Stadium, noto anche come Juventus Stadium o più semplicemente Stadium, è un impianto calcistico di Torino, situato nei quartieri Vallette e Lucento in prossimità dell'area Continassa, nella V circoscrizione nell'area nord-occidentale della città, al confine con Venaria Reale. Di proprietà della società calcistica Juventus Football Club, è sede degli incontri interni della sua prima squadra dalla stagione 2011-2012. Sesto stadio italiano per capienza con 41 507 spettatori, nonché il primo del Piemonte, sorge sulla stessa area del preesistente e demolito stadio delle Alpi, di cui riutilizza parte delle strutture.
Prima struttura calcistica italiana priva di barriere architettoniche nonché primo impianto ecocompatibile al mondo,[6] è uno dei quattro stadi italiani (assieme all'Olimpico di Roma, al Giuseppe Meazza di Milano e all'Olimpico Grande Torino di Torino) a rientrare nella categoria 4 UEFA, ovvero quella con maggior livello tecnico. Inoltre, rappresenta il primo impianto moderno di proprietà di un club in Italia.
Ritenuto tra gli impianti più avanzati a livello mondiale, oltre che uno dei simboli architettonici della Torino contemporanea[10] nonché tra i maggiori poli di attrazione turistica della città, lo Stadium è stato premiato con lo Stadium Innovation Trophy al Global Sports Forum 2012 quale scenario sportivo più innovativo d'Europa; la sua cerimonia d'inaugurazione, avvenuta l'8 settembre 2011, ha vinto il premio come miglior evento celebrativo in Italia ai Best Event Awards Italia.
Noto dalla sua inaugurazione e sino al 2017 come lo Juventus Stadium — titolazione che tuttora mantiene in occasione di competizioni confederali —, dal 1º luglio dello stesso anno ha assunto il nome commerciale di Allianz Stadium a seguito della cessione dei diritti di denominazione ad Allianz.", -1, 2);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Wembley Stadium", "Inghilterra", "Londra", "Royal route", "90000", "Wembley Stadium è un impianto sportivo, situato nell'omonimo sobborgo di Londra aperto nel 2007 che sostituisce il precedente Wembley Stadium, inaugurato nel 1923 e demolito nel 2003. Completato nel 2007 con la spesa da primato di 757 milioni di sterline (918 milioni di euro), il nuovo Wembley è lo stadio più costoso mai costruito dopo lo Yankee Stadium con 1,5 miliardi di dollari (1,1 miliardi di euro). È pensato come un unico, grande catino, capace di ospitare 90.000 spettatori tutti con posto a sedere, secondo stadio per capienza in tutta Europa dopo il Camp Nou di Barcellona. Nonostante sia stato concepito principalmente per il calcio, il rugby ed i concerti musicali, il nuovo Wembley è in grado di ospitare anche manifestazioni internazionali di atletica leggera. Per garantire la visibilità, la pista di atletica verrà montata solo quando necessario, coprendo una parte del terreno di gioco e dei posti (la capienza si ridurrà a circa 70.000 spettatori), e rimossa una volta terminato l'evento.", 3, -1);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Capienza, Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Stamford Bridge", "Inghilterra", "Londra", "Fulham Rd", "41631", "Lo Stamford Bridge è uno stadio di calcio situato a Londra, in Inghilterra. È lo stadio di proprietà del Chelsea, dove il club disputa le proprie partite casalinghe.[1]
Inaugurato nel 1877, è lo stadio più antico del Regno Unito, e con una capienza di 41.631 spettatori ha rappresentato lo stadio calcistico più grande della capitale britannica fino al 2006, anno in cui i rivali dell'Arsenal hanno inaugurato il loro nuovo impianto, l'Emirates Stadium.
La struttura è situata di fronte a Fulham Road, nel London Borough of Hammersmith and Fulham, confinante col quartiere di Chelsea, dal quale il club trae il suo nome. Nel medesimo distretto, a soli due chilometri di distanza, si trova il Craven Cottage, stadio del Fulham, squadra con la quale il Chelsea nutre un'accesa rivalità.", 3, -1);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Camp Nou", "Spagna", "Barcellona", "Avinguda de Joan XIII", "99 354", "Il Camp Nou è un impianto calcistico spagnolo ubicato nel quartiere Les Corts della città di Barcellona.
Di proprietà del Futbol Club Barcelona, ospita gli incontri casalinghi della sua prima squadra dal 1957. Con una capacità di 99 354 spettatori, è l'impianto più capiente di Spagna e d'Europa, davanti al nuovo Wembley di Londra (90 000) e allo stadio San Siro di Milano (81 277).
Fino al 2001 struttura era nota ufficialmente come Estadi del Futbol Club Barcelona. In seguito, un referendum tra i soci del club decretò il cambio del nome in Camp Nou, denominazione con la quale l'impianto era indicato informalmente dal 1957, anno della sua costruzione in sostituzione del vecchio Camp de Les Corts. Inaugurato il 24 settembre 1957, nel 1998 è stato inserito nella categoria 4 della classificazione UEFA. Vicino all'imponente struttura sono presenti altre installazioni del club come La Masia e il Mini Estadi, lo stadio in cui gioca la seconda squadra del Barcellona.
Il Camp Nou ha ospitato due finali di Coppa dei Campioni/UEFA Champions League: la prima il 24 maggio 1989, quando il Milan sconfisse la Steaua Bucarest per 4-0; la seconda il 26 maggio 1999, in occasione della vittoria del Manchester United sul Bayern Monaco. In totale sono cinque le finali europee svoltesi al Camp Nou, a cui si aggiungono le numerose finali di Coppa del Re e le partite delle fasi finali del campionato d'Europa del 1964, del campionato del mondo del 1982 e l'Olimpiade del 1992.", -1, 1);




#---------------------------Evento--------------------------

insert into Evento(Titolo, Data_Evento, Stadio_Nome) 
values("Vado al massimo Tour", "1996-11-21", "San Siro");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Vasco Rossi", 1);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Tarantelle Tour", "2016-04-17", "San Paolo");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Clementino", 2);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Nessuno è solo Tour", "2021-06-09", "Wembley Stadium");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Tiziano Ferro", 3);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Eminem show Tour", "2022-05-26", "Camp Nou");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Eminem", 4);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Night Visions Tour", "2011-03-01", "Stamford Bridge");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Imagine Dragons", 5);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Brave Tour", "2008-08-30", "San Siro");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Jennifer Lopez", 6);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Zzala Tour", "2021-04-05", "Allianz Stadium");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Lazza", 7);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Il ballo della vita Tour", "2000-01-01", "San Paolo");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Maneskin", 8);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Adesso Tour", "2015-12-15", "Stamford Bridge");

insert into Concerto(ArtistaBand, Evento_ECodiceID) 
values("Emma marrone", 9);


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Napoli vs Torino", "2020-12-01", "San Paolo");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 10, "Napoli", "Torino");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Juventus vs Atalanta", "2018-04-13", "Allianz Stadium");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 11, "Juventus", "Atalanta");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Inghilterra vs Germania", "2015-10-14", "Wembley Stadium");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 12, "Inghilterra", "Germania");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Chelsea vs Manchester City", "2021-03-11", "Stamford Bridge");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 13, "Chelsea", "Manchester City");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Barcellona vs Real Madrid", "2015-03-26", "Camp Nou");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 14, "Barcellona", "Real Madrid");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Italia vs Francia", "2009-12-16", "San Siro");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 15, "Italia", "Francia");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Napoli vs Sampdoria", "2017-01-18", "San Paolo");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 16, "Napoli", "Sampdoria");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Milan vs Empoli", "2008-02-01", "San Siro");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 17, "Milan", "Empoli");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Italia vs Spagna", "2021-06-15", "Allianz Stadium");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 18, "Italia", "Spagna");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Chelsea vs Fulham", "2013-09-21", "Stamford Bridge");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 19, "Chelsea", "Fulham");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Barcellona vs Getafe", "2021-02-18", "Camp Nou");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 20, "Barcellona", "Getafe");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Inghilterra vs Belgio", "2004-11-08", "Wembley Stadium");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 21, "Inghilterra", "Belgio");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Napoli vs Genoa", "2018-10-14", "San Paolo");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 22, "Napoli", "Genoa");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Inter vs Parma", "2012-09-01", "San Siro");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 23, "Inter", "Parma");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Spagna vs Portogallo", "2007-04-05", "Camp Nou");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 24, "Spagna", "Portogallo");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Chelsea vs Arsenal", "2016-04-18", "Stamford Bridge");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 25, "Chelsea", "Arsenal");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Inghilterra vs Irlanda", "2011-02-14", "Wembley Stadium");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 26, "Inghilterra", "Irlanda");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Italia vs Turchia", "2006-09-01", "San Siro");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 27, "Italia", "Turchia");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Napoli vs Lazio", "2012-12-16", "San Paolo");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 28, "Napoli", "Lazio");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Juventus vs Roma", "2018-05-11", "Allianz Stadium");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 29, "Juventus", "Roma");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Barcellona vs Atletico Madrid", "2016-10-13", "Camp Nou");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Calcio", 30, "Barcellona", "Atletico Madrid");


insert into Evento(Titolo, Data_Evento, Stadio_Nome)
values("Inghilterra vs Polonia", "2009-07-17", "Stamford Bridge");

insert into EventoSportivo(Tipo, Evento_ECodiceID, Squadra1, Squadra2)
values("Rugby", 31, "Inghilterra", "Polonia");



#--------------------------Biglietto------------------------
set @EventoECodiceID = 2;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 2;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 2;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.00, 10, @EventoECodiceID);


set @EventoECodiceID = 2;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.00, 10, @EventoECodiceID);


set @EventoECodiceID = 18;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 18;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 18;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 22.50, 10, @EventoECodiceID);


set @EventoECodiceID = 18;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 22.50, 10, @EventoECodiceID);


set @EventoECodiceID = 22;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 22;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 22;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 17.00, 10, @EventoECodiceID);


set @EventoECodiceID = 22;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 17.00, 10, @EventoECodiceID);


set @EventoECodiceID = 1;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 1;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 1;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 18.00, 10, @EventoECodiceID);


set @EventoECodiceID = 1;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 18.00, 10, @EventoECodiceID);


set @EventoECodiceID = 15;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 15;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 15;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 19.50, 10, @EventoECodiceID);


set @EventoECodiceID = 15;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 19.50, 10, @EventoECodiceID);


set @EventoECodiceID = 4;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 4;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 4;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 16.00, 10, @EventoECodiceID);


set @EventoECodiceID = 4;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 16.00, 10, @EventoECodiceID);


set @EventoECodiceID = 28;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 28;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 28;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 14.00, 10, @EventoECodiceID);


set @EventoECodiceID = 28;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 14.00, 10, @EventoECodiceID);


set @EventoECodiceID = 17;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 17;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 17;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 20.50, 10, @EventoECodiceID);


set @EventoECodiceID = 17;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 20.50, 10, @EventoECodiceID);


set @EventoECodiceID = 12;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 12;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 12;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 21.50, 10, @EventoECodiceID);


set @EventoECodiceID = 12;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 21.50, 10, @EventoECodiceID);


set @EventoECodiceID = 24;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 24;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 24;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.00, 10, @EventoECodiceID);


set @EventoECodiceID = 24;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.00, 10, @EventoECodiceID);


set @EventoECodiceID = 16;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 16;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 16;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 25.50, 10, @EventoECodiceID);


set @EventoECodiceID = 16;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 25.50, 10, @EventoECodiceID);


set @EventoECodiceID = 19;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 19;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 19;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 20.00, 10, @EventoECodiceID);


set @EventoECodiceID = 19;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 20.00, 10, @EventoECodiceID);


set @EventoECodiceID = 6;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 6;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 6;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 22.00, 10, @EventoECodiceID);


set @EventoECodiceID = 6;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 22.00, 10, @EventoECodiceID);


set @EventoECodiceID = 30;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 30;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 30;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 23.00, 10, @EventoECodiceID);


set @EventoECodiceID = 30;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 23.00, 10, @EventoECodiceID);


set @EventoECodiceID = 9;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 9;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 9;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 18.00, 10, @EventoECodiceID);


set @EventoECodiceID = 9;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 18.00, 10, @EventoECodiceID);


set @EventoECodiceID = 21;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 11.50, 10, @EventoECodiceID);


set @EventoECodiceID = 21;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 11.50, 10, @EventoECodiceID);


set @EventoECodiceID = 21;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 21;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 20;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 12.50, 10, @EventoECodiceID);


set @EventoECodiceID = 20;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.50, 10, @EventoECodiceID);


set @EventoECodiceID = 20;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 20;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 26;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.50, 10, @EventoECodiceID);


set @EventoECodiceID = 26;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.50, 10, @EventoECodiceID);


set @EventoECodiceID = 26;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 26;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 29;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 8.00, 10, @EventoECodiceID);


set @EventoECodiceID = 29;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 8.00, 10, @EventoECodiceID);


set @EventoECodiceID = 29;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 29;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 27;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 11.50, 10, @EventoECodiceID);


set @EventoECodiceID = 27;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 11.50, 10, @EventoECodiceID);


set @EventoECodiceID = 27;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 27;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 13;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 6.00, 10, @EventoECodiceID);


set @EventoECodiceID = 13;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 6.00, 10, @EventoECodiceID);


set @EventoECodiceID = 13;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 13;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 23;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 8.00, 10, @EventoECodiceID);


set @EventoECodiceID = 23;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 8.00, 10, @EventoECodiceID);


set @EventoECodiceID = 23;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 23;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 14;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 7.00, 10, @EventoECodiceID);


set @EventoECodiceID = 14;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 7.00, 10, @EventoECodiceID);


set @EventoECodiceID = 14;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 14;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 11;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 9.00, 10, @EventoECodiceID);


set @EventoECodiceID = 11;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 9.00, 10, @EventoECodiceID);


set @EventoECodiceID = 11;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 11;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 25;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 5.00, 10, @EventoECodiceID);


set @EventoECodiceID = 25;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 5.00, 10, @EventoECodiceID);


set @EventoECodiceID = 25;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 25;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 10.00, 10, @EventoECodiceID);


set @EventoECodiceID = 10;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 11.50, 10, @EventoECodiceID);


set @EventoECodiceID = 10;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 11.50, 10, @EventoECodiceID);


set @EventoECodiceID = 10;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 10;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 8;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 10.50, 10, @EventoECodiceID);


set @EventoECodiceID = 8;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 10.50, 10, @EventoECodiceID);


set @EventoECodiceID = 8;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 8;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 12.50, 10, @EventoECodiceID);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.50, 10, @EventoECodiceID);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoECodiceID);


set @EventoECodiceID = 5;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 8.00, 10, @EventoECodiceID);


set @EventoECodiceID = 5;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 8.00, 10, @EventoECodiceID);


set @EventoECodiceID = 5;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 5;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 3;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva1", 7.00, 10, @EventoECodiceID);


set @EventoECodiceID = 3;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 7.00, 10, @EventoECodiceID);


set @EventoECodiceID = 3;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 12.00, 10, @EventoECodiceID);


set @EventoECodiceID = 3;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 12.00, 10, @EventoECodiceID);


#-----------------------------Utente---------------------------------

insert into Utente(NomeUtente, Password, Email) 
values("Luigio", "THVpZ2lvMTIz", "Luigioesp123@gmail.com");

insert into Utente(NomeUtente, Password, Email)
values("Peppino", "UGVwcGlubzEyMw==", "Peppinoferr123@gmail.com");

insert into Utente(NomeUtente, Password, Email) 
values("Antonio", "QW50b25pbzEyMw==", "Antoniogiord123@gmail.com");

insert into Utente(NomeUtente, Password, Email) 
values("Angela", "QW5nZWxhMTIz", "Angelapas123@gmail.com");

insert into Utente(NomeUtente, Password, Email, CodiceAdmin) 
values("Giuliana", "R2l1bGlhbmExMjM=", "Giulianafog123@gmail.com", "112233");

insert into Utente(NomeUtente, Password, Email, CodiceAdmin) 
values("Fabio", "RmFiaW8xMjM=", "Fabiomil123@gmail.com", "445566");


#---------------------------------Acquista--------------------------------

insert into acquista(utente_NomeUtente, Biglietto_Codice_Biglietto)
values("Luigio", 6);

insert into acquista(utente_NomeUtente, Biglietto_Codice_Biglietto)
values("Giuliana", 12);

insert into acquista(utente_NomeUtente, Biglietto_Codice_Biglietto)
values("Angela", 25);

insert into acquista(utente_NomeUtente, Biglietto_Codice_Biglietto)
values("Giuliana", 14);

insert into acquista(utente_NomeUtente, Biglietto_Codice_Biglietto)
values("Antonio", 3);