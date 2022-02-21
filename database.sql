CREATE TABLE Syggrafeas (
  ID INTEGER  NOT NULL  ,
  Onoma VARCHAR(30)    ,
  Epwnimo VARCHAR(30)    ,
  email VARCHAR(30)      ,
PRIMARY KEY(ID));



CREATE TABLE Pelatis (
  ID INTEGER  NOT NULL  ,
  Onoma VARCHAR(30)    ,
  Epwnimo VARCHAR(30)    ,
  Patrwnimo VARCHAR(30)    ,
  email VARCHAR(30)    ,
  Poli VARCHAR(30)    ,
  Odos VARCHAR(30)    ,
  Arithmos VARCHAR(30)    ,
  TK VARCHAR(30)      ,
PRIMARY KEY(ID));



CREATE TABLE Ekdotikos_oikos (
  ID INTEGER  NOT NULL  ,
  Onoma VARCHAR(30)    ,
  Poli VARCHAR(30)    ,
  Odos VARCHAR(30)    ,
  Arithmos VARCHAR(30)    ,
  TK VARCHAR(30)      ,
PRIMARY KEY(ID));



CREATE TABLE Apothiki (
  ID INTEGER  NOT NULL  ,
  Tilefwno VARCHAR(30)    ,
  Poli VARCHAR(30)    ,
  Odos VARCHAR(30)    ,
  Arithmos VARCHAR(30)    ,
  TK VARCHAR(30)      ,
PRIMARY KEY(ID));



CREATE TABLE Tilefwna_pelati (
  Pelatis_ID INTEGER  NOT NULL  ,
  Tilefwno VARCHAR(30)  NOT NULL    ,
  FOREIGN KEY(Pelatis_ID)
    REFERENCES Pelatis(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Tilefwna_pelati_FKIndex1 ON Tilefwna_pelati (Pelatis_ID);



CREATE TABLE Tilefwna_ekdotikou_oikou (
  Ekdotikos_oikos_ID INTEGER  NOT NULL  ,
  Tilefwno VARCHAR(30)  NOT NULL    ,
  FOREIGN KEY(Ekdotikos_oikos_ID)
    REFERENCES Ekdotikos_oikos(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Tilefwna_ekdotikou_oikou_FKIndex1 ON Tilefwna_ekdotikou_oikou (Ekdotikos_oikos_ID);



CREATE TABLE Kalathi (
  ID INTEGER  NOT NULL  ,
  Pelatis_ID INTEGER  NOT NULL  ,
  Hmerominia DATE      ,
PRIMARY KEY(ID, Pelatis_ID)  ,
  FOREIGN KEY(Pelatis_ID)
    REFERENCES Pelatis(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Kalathi_FKIndex1 ON Kalathi (Pelatis_ID);



CREATE TABLE Biblio (
  ID INTEGER  NOT NULL  ,
  Apothiki_ID INTEGER  NOT NULL  ,
  Ekdotikos_oikos_ID INTEGER  NOT NULL  ,
  Titlos VARCHAR(30)    ,
  ISBN VARCHAR(30)    ,
  Timi DOUBLE    ,
  Etos_ekdosis INTEGER    ,
  Diathesimi_posotita INTEGER      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(Ekdotikos_oikos_ID)
    REFERENCES Ekdotikos_oikos(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Apothiki_ID)
    REFERENCES Apothiki(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Biblio_FKIndex1 ON Biblio (Ekdotikos_oikos_ID);
CREATE INDEX Biblio_FKIndex2 ON Biblio (Apothiki_ID);



CREATE TABLE Graftike (
  Biblio_ID INTEGER  NOT NULL  ,
  Syggrafeas_ID INTEGER  NOT NULL    ,
PRIMARY KEY(Biblio_ID, Syggrafeas_ID)    ,
  FOREIGN KEY(Biblio_ID)
    REFERENCES Biblio(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Syggrafeas_ID)
    REFERENCES Syggrafeas(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Biblio_has_Syggrafeas_FKIndex1 ON Graftike (Biblio_ID);
CREATE INDEX Biblio_has_Syggrafeas_FKIndex2 ON Graftike (Syggrafeas_ID);



CREATE TABLE Periexei (
  Biblio_ID INTEGER  NOT NULL  ,
  Kalathi_ID INTEGER  NOT NULL  ,
  Kalathi_Pelatis_ID INTEGER  NOT NULL  ,
  Posotita INTEGER      ,
PRIMARY KEY(Biblio_ID, Kalathi_ID)    ,
  FOREIGN KEY(Biblio_ID)
    REFERENCES Biblio(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Kalathi_ID, Kalathi_Pelatis_ID)
    REFERENCES Kalathi(ID, Pelatis_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Biblio_has_Kalathi_FKIndex1 ON Periexei (Biblio_ID);
CREATE INDEX Biblio_has_Kalathi_FKIndex2 ON Periexei (Kalathi_ID, Kalathi_Pelatis_ID);



