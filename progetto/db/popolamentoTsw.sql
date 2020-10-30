
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

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("San Paolo", "Italia", "Napoli", "via Claudio", "descrizione a caso", 1, null);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("San Siro", "Italia", "Milano", "via dei piccolomini", "descrizione a caso", 2, null);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Allianz Stadium", "Italia", "Torino", "via corso Gaetano Scirea", "descrizione a caso", null, 2);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Wembley Stadium", "Inghilterra", "Londra", "Royal route", "descrizione a caso", 3, null);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Stamford Bridge", "Inghilterra", "Londra", "Fulham Rd", "descrizione a caso", 3, null);

insert into Stadio(Nome, Nazione, Città, Indirizzo , Descrizione, Comune_CCodiceID, Società_SCodiceID)
values("Camp Nou", "Spagna", "Barcellona", "Avinguda de Joan XIII", "descrizione a caso", null, 1);




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
values("Curva1", 12.50, 10, @EventoTitolo);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Curva2", 12.50, 10, @EventoTitolo);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna1", 15.50, 10, @EventoTitolo);


set @EventoECodiceID = 7;

insert into Biglietto(Settore, Costo, Quantità, Evento_ECodiceID)
values("Tribuna2", 15.50, 10, @EventoTitolo);


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



#--------------------------Ospite---------------------------
set @ArtistaBand = "Vasco Rossi";
set @Evento_ECodiceID = 1;

insert into Ospite(CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID)
values("ab452ceve71", "Gianni Morandi", @ArtistaBand, @Evento_ECodiceID);


set @ArtistaBand = "Tiziano Ferro";
set @Evento_ECodiceID = 3;

insert into Ospite(CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID)
values("sk489wfmp02", "Francesco Renga", @ArtistaBand, @Evento_ECodiceID);


set @ArtistaBand = "Clementino";
set @Evento_ECodiceID = 2;

insert into Ospite(CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID)
values("ls456uhgy15", "Rocco Hunt", @ArtistaBand, @Evento_ECodiceID);


set @ArtistaBand = "Lazza";
set @Evento_ECodiceID = 7;

insert into Ospite(CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID)
values("ji125iody26", "Giaime", @ArtistaBand, @Evento_ECodiceID);


set @ArtistaBand = "Eminem" ;
set @Evento_ECodiceID = 4;

insert into Ospite(CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID)
values("cd265njcm74", "50 cent", @ArtistaBand, @Evento_ECodiceID);


set @ArtistaBand = "Jennifer Lopez" ;
set @Evento_ECodiceID = 6;

insert into Ospite(CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID)
values("il790uveu13", "Billie Eilish", @ArtistaBand, @Evento_ECodiceID);

#-----------------------------Utente---------------------------------

insert into Utente(NomeUtente, Password, Email) 
values("Luigio", "Luigio123", "Luigioesp123@gmail.com");

insert into Utente(NomeUtente, Password, Email)
values("Peppino", "Peppino123", "Peppinoferr123@gmail.com");

insert into Utente(NomeUtente, Password, Email) 
values("Antonio", "Antonio123", "Antoniogiord123@gmail.com");

insert into Utente(NomeUtente, Password, Email) 
values("Angela", "Angela123", "Angelapas123@gmail.com");

insert into Utente(NomeUtente, Password, Email, CodiceAdmin) 
values("Giuliana", "Giuliana123", "Giulianafog123@gmail.com", "112233");

insert into Utente(NomeUtente, Password, Email, CodiceAdmin) 
values("Fabio", "Fabio123", "Fabiomil123@gmail.com", "445566");


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