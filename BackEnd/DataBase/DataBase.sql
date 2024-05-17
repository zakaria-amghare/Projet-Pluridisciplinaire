create database "OurDataBase";
\c OurDataBase;
--creation de la table jour
create table Jour(IdJour serial primary key not null,JourDeSeance date,VolumeHorair time check(VolumeHorair>='00:00'));
--creation de la table salle
create table Salle(IdSalle serial primary key not null,nomSalle varchar(10)not null,capacite int check(capacite>0),typeSalle varchar(4)not null);
--creation de la table Parcour(LMD ou ENG)
create table Parcour(IdParcour serial primary key not null,nomParcour varchar(10)not null,specialite varchar(15)not null);
--creation de la table annee scolaire 
create table AnneeScolaire(IdAnneeScolaire serial primary key not null,DateDebut date not null,DateFin date not null);
--creationd de la table departement
create table Departement(IdDepartement serial primary key not null,nomDepartement varchar(50)not null);
--creation de la table module
create table Module(IdModule serial primary key not null,nomModule varchar(50)not null,HCour time,HTD time,HTP time,Coefficient int not null);
--creation de la table semestre
create table Semestre(IdSemestre serial primary key not null,nomSemestre varchar(10)not null,IdAnneeScolaire int,FOREIGN key (IdAnneeScolaire) REFERENCES AnneeScolaire(IdAnneeScolaire));
--creation de la table niveau(1er annee-5eme annee)
create table Niveau(IdNiveau serial primary key not null,nomNiveau varchar(10) not null,IdSemestre int,FOREIGN key (IdSemestre) REFERENCES Semestre(IdSemestre));
--creation de la table section
create table Section(IdSection serial primary key not null,nomSection varchar(1)not null,Effectif int not null,IdParcour int,IdNiveau int,IdDepartement int,FOREIGN key (IdParcour) REFERENCES Parcour(IdParcour),FOREIGN key (IdNiveau) REFERENCES Niveau(IdNiveau),FOREIGN key (IdDepartement) REFERENCES Departement(IdDepartement));
--creation la table seance
create table Seance(IdSeance serial primary key not null,HDebut time,HFin time check(HFin > HDebut),typeSeance varchar(4)not null,IdSection int,IdJour int,IdSalle int,FOREIGN key (IdSection) REFERENCES Section(IdSection),FOREIGN key (IdJour) REFERENCES Jour(IdJour),FOREIGN key (IdSalle) REFERENCES Salle(IdSalle));
--creation la relation repartir(entre seance et module)
create table Repartir(IdModule int,IdSeance int,FOREIGN key (IdModule) REFERENCES Module(IdModule),FOREIGN key (IdSeance) REFERENCES Seance(IdSeance));
--creation de la table enseignant
create table Enseignant(IdEnseignant serial primary key not null,nomEnseignant varchar(30)not null,prenomEnseignant varchar(30)not null,email varchar(30)not null check(email LIKE '%_@__%.__%'),NTelephone varchar not null check(NTelephone LIKE '0_________'),grade varchar(30)not null,IdDepartement int,FOREIGN key (IdDepartement) REFERENCES Departement(IdDepartement));
--creation de la relation cour(entre seance et enseignant)
create table Cour(IdSeance int,IdEnseignant int,FOREIGN key (IdSeance) REFERENCES Seance(IdSeance),FOREIGN key (IdEnseignant) REFERENCES Enseignant(IdEnseignant));
--creation de la relation comprendre(entre module et semestre)
create table Comprendre(IdModule int,IdSemestre int,FOREIGN key (IdModule) REFERENCES Module(IdModule),FOREIGN key (IdSemestre) REFERENCES Semestre(IdSemestre));
--creation de la relation Enseigner(entre module et enseignat)
create table Enseigner(IdModule int,IdEnseignant int,FOREIGN key (IdModule) REFERENCES Module(IdModule),FOREIGN key (IdEnseignant) REFERENCES Enseignant(IdEnseignant));

-- Insertion de data
\i C:/Users/Mey/OneDrive/Desktop/ProjetPluridiciplinaire/Data/Salle.sql;
\i C:/Users/Mey/OneDrive/Desktop/ProjetPluridiciplinaire/Data/Departement.sql;
\i C:/Users/Mey/OneDrive/Desktop/ProjetPluridiciplinaire/Data/Module.sql;
\i C:/Users/Mey/OneDrive/Desktop/ProjetPluridiciplinaire/Data/Parcour.sql;
\i C:/Users/Mey/OneDrive/Desktop/ProjetPluridiciplinaire/Data/Enseignant.sql;


