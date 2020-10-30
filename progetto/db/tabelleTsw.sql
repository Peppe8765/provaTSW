DROP DATABASE IF EXISTS TicketS;

CREATE DATABASE TicketS;
USE TicketS;

#creazione tabella Comune
CREATE TABLE Comune(
Città varchar(255) not null,
CCodiceID int auto_increment,
PRIMARY KEY(CCodiceID));

#creazione tabella Società
CREATE TABLE Società(
Nome varchar(255) not null,
SCodiceID int auto_increment,
AnnoFondazione Int default 0,
PRIMARY KEY(SCodiceID));

#creazione tabella Stadio
CREATE TABLE Stadio (
Nome varchar(255) not null,
Nazione varchar(255) not null,
Città varchar(255) not null,
Indirizzo varchar(255) not null,
Capienza Int default 0,
Descrizione varchar(9999) not null,
Comune_CCodiceID int ,
Società_SCodiceID int ,
PRIMARY KEY(Nome),
foreign key(Comune_CCodiceID) references Comune(CCodiceID),
foreign key(Società_SCodiceID) references Società(SCodiceID));

#creazione tabella Evento
CREATE TABLE Evento(
ECodiceID int auto_increment,
Titolo varchar(255) not null,
Data_Evento Date not null,
Stadio_Nome varchar(255) not null,
PRIMARY KEY(ECodiceID),
foreign key(Stadio_Nome) references Stadio(Nome));

#creazione tabella EventoSportivo
CREATE TABLE EventoSportivo(
Tipo varchar(255) not null,
Evento_ECodiceID int,
Squadra1 varchar(255) not null,
Squadra2 varchar(255) not null,
primary key (Tipo,Evento_ECodiceID),
foreign key(Evento_ECodiceID) references Evento(ECodiceID));

#creazione tabella Concerto
CREATE TABLE Concerto(
ArtistaBand varchar(255) not null,
Evento_ECodiceID int,
PRIMARY KEY(ArtistaBand,Evento_ECodiceID),
foreign key(Evento_ECodiceID) references Evento(ECodiceID));


#creazione tabella Biglietto
CREATE TABLE Biglietto(
Codice_Biglietto int auto_increment,
Settore varchar(255) not null,
Costo double default 0.0,
Quantità int not null,
Evento_ECodiceID int,
PRIMARY KEY(Codice_Biglietto),
foreign key(Evento_ECodiceID) references Evento(ECodiceID));

#creazione tabella Ospite
CREATE TABLE Ospite(
CF char(11) not null,
Nome varchar(255) not null,
Concerto_ArtistaBand varchar(255) not null,
Concerto_Evento_ECodiceID int,
PRIMARY KEY(CF),
foreign key(Concerto_ArtistaBand) references Concerto(ArtistaBand),
foreign key(Concerto_Evento_ECodiceID) references Concerto(Evento_ECodiceID));

#creazione tabella utente
CREATE TABLE utente(
NomeUtente varchar(255) not null,
Password varchar(255) not null,
Email varchar(255) not null,
CodiceAdmin int default -1,
FotoProfilo mediumblob,
primary key(NomeUtente)
);

CREATE TABLE acquista(
utente_NomeUtente varchar(255) not null,
Biglietto_Codice_Biglietto int auto_increment,
primary key(utente_NomeUtente , Biglietto_Codice_Biglietto),
foreign key(utente_NomeUtente) references utente(NomeUtente),
foreign key(Biglietto_Codice_Biglietto) references Biglietto(Codice_Biglietto));

SELECT * FROM Evento WHERE Stadio_Nome = "San Siro";


#insert into acquista(utente_NomeUtente, Biglietto_Codice_Biglietto) values ("Angelo", 1);
#update Biglietto set quantità = quantità -1 where Codice_Biglietto = 1; 


#select * from Evento;

#select max(ECodiceID) FROM evento;

#insert into Biglietto( Settore, Costo, Quantità, Evento_ECodiceID) values( "settore1", 10.0, 30, 1);

#select * from Evento where ECodiceID = 10 and (select * from EventoSportivo where ECodiceID = Evento_ECodiceID); 
#select * from Evento, eventosportivo where ECodiceID = Evento_ECodiceID order by ECodiceID;



#insert into utente(NomeUtente, Password, Email) values("utente1" ,"niente1", "coseACaso1@robe.it");
#insert into utente(NomeUtente, Password, CodiceAdmin, Email ,FotoProfilo) values("utente2","niente2", 11111,"coseACaso2@robe.it",load_file('/Users/giuse/OneDrive/Desktop/cose/coso.pdf'));
#update utente set FotoProfilo = (load_file('/Users/giuse/OneDrive/Desktop/cose/Cattura.JPG')) where NomeUtente = "utente2";



#select * from utente where FotoProfilo !="null";

#insert into utente(NomeUtente, Password, CodiceAdmin ,Email) values("utente3", "niente3", 12345, "coseACaso3@robe.it");

#INSERT INTO foto(Foto) VALUES (load_file('/Users/giuse/OneDrive/Desktop/cose/JuventusStadium.jpg'));
#SELECT Foto FROM foto WHERE Id = 1 INTO DUMPFILE '/Users/giuse/OneDrive/Desktop/cose/gsaefgsa.jpg';
#Select * from foto;
#select Foto from foto where Id=1;
#drop table foto;
#SHOW VARIABLES LIKE 'secure_file_priv'




#C:\ProgramData\MySQL\MySQL Server 8.0\my.in