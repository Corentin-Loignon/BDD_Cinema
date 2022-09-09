CREATE DATABASE IF NOT EXISTS Cinema_BDD CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER 'Natalie'@'localhost' IDENTIFIED BY '1jDfj%hFGYSDGF%78hj';
GRANT ALL PRIVILEGES ON Cinema_BDD.* TO 'Natalie'@'localhost';
CREATE USER 'Roland'@'localhost' IDENTIFIED BY 'hj7A8Ej%hFg54hgGF%454';
GRANT ALL PRIVILEGES ON Cinema_BDD.* TO 'Roland'@'localhost';
CREATE USER 'Thomas'@'localhost' IDENTIFIED BY '98d74fj%h30dfF%x5q';
GRANT ALL PRIVILEGES ON Cinema_BDD.* TO 'Thomas'@'localhost';
CREATE USER 'Elisabteh'@'localhost' IDENTIFIED BY 'hjSDfj%hlGY65GF%4f0';
GRANT ALL PRIVILEGES ON Cinema_BDD.* TO 'Elisabteh'@'localhost';

USE Cinema_BDD;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS cinema (
  id_cinema INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(50) NOT NULL,
  adresse VARCHAR(2550) NOT NULL,
  telephone INT(10) NOT NULL,
  nombre_salle INT NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS salle (
  id_salle INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(50) NOT NULL,
  nombre_siege INT NOT NULL,
  id_cinema INT NOT NULL,
  FOREIGN KEY(id_cinema) REFERENCES cinema(id_cinema)
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS film (
  id_film INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  titre VARCHAR(50) NOT NULL,
  duree TIME NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS client (
  id_client INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  nom VARCHAR(50) NOT NULL,
  mail VARCHAR(100) NOT NULL,
  telephone INT(10) NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS administrateur (
  id_admin INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  nom VARCHAR(50) NOT NULL,
  mail VARCHAR(100) NOT NULL,
  mot_de_passe VARCHAR(50) NOT NULL,
  telephone INT(10) NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS tarif (
  id_tarif INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  type_tarif VARCHAR(30) NOT NULL,
  prix DECIMAL(10,2) NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS seance (
  id_seance INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  date_seance DATE NOT NULL,
  horaire_debut TIME NOT NULL,
  id_cinema INT NOT NULL,
  FOREIGN KEY(id_cinema) REFERENCES cinema(id_cinema),
  id_film INT NOT NULL,
  FOREIGN KEY(id_film) REFERENCES film(id_film),
  id_tarif INT,
  FOREIGN KEY(id_tarif) REFERENCES tarif(id_tarif),
  id_admin INT,
  FOREIGN KEY(id_admin) REFERENCES administrateur(id_admin)
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS reservation (
  id_reservation INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  date_reservation DATE NOT NULL,
  nombre_place INT NOT NULL,
  id_client INT,
  FOREIGN KEY(id_client) REFERENCES client(id_client),
  id_seance INT,
  FOREIGN KEY(id_seance) REFERENCES seance(id_seance)
)ENGINE = INNODB;

insert into cinema (id_cinema, nom, adresse, telephone, nombre_salle) values (1, 'Le Champo', '51 rue des Écoles, 75005 Paris', '0114243327 ',2);
insert into cinema (id_cinema, nom, adresse, telephone, nombre_salle) values (2, 'Les 3 Luxembourg', '67 rue Monsieur-le-Prince, 75006 Paris', '0140377905 ',3);
insert into cinema (id_cinema, nom, adresse, telephone, nombre_salle) values (3, 'La Rotonde', '102 Rue Saint-Jacques, 91150 Étampes', '0147807588 ',3);
insert into cinema (id_cinema, nom, adresse, telephone, nombre_salle) values (4, 'Pathé Saran', '1010 Route Nationale 20, 45770 Saran', '0194017533 ',10);

insert into salle (id_salle, nom, nombre_siege, id_cinema) values (1, 'Salle 1', 130, 1);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (2, 'Salle 2', 120, 1);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (3, 'Salle 1', 130, 2);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (4, 'Salle 2', 110, 2);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (5, 'Salle 3', 80, 2);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (6, 'Salle 1', 120, 3);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (7, 'Salle 2', 110, 3);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (8, 'Salle 3', 90, 3);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (9, 'Salle 1', 450, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (10, 'Salle 2', 400, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (11, 'Salle 3', 350, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (12, 'Salle 4', 300, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (13, 'Salle 5', 250, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (14, 'Salle 6', 230, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (15, 'Salle 7', 200, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (16, 'Salle 8', 210, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (17, 'Salle 9', 180, 4);
insert into salle (id_salle, nom, nombre_siege, id_cinema) values (18, 'Salle 10', 140, 4);

insert into film (id_film, titre, duree) values (1, 'Léon', '1:43');
insert into film (id_film, titre, duree) values (2, 'Interstellar', '2:49');
insert into film (id_film, titre, duree) values (3, 'Avengers: Infinity War', '2:36');
insert into film (id_film, titre, duree) values (4, 'Your Name', '1:50');
insert into film (id_film, titre, duree) values (5, 'Intouchables', '1:52');
insert into film (id_film, titre, duree) values (6, 'Matrix', '2:15');
insert into film (id_film, titre, duree) values (7, 'Shutter Island', '2:17');
insert into film (id_film, titre, duree) values (8, 'Sixième Sens', '1:47');

insert into client (id_client, prenom, nom, mail, telephone) values (1, 'Claire', 'Tollmache', 'claire.tollmache@gmail.com','0651801863');
insert into client (id_client, prenom, nom, mail, telephone) values (2, 'Romain', 'Course', 'romain.course@gmail.com','0645876219');
insert into client (id_client, prenom, nom, mail, telephone) values (3, 'Mireille', 'Vachon', 'mireille.vachon@gmail.com','0636876417');
insert into client (id_client, prenom, nom, mail, telephone) values (4, 'Margaux', 'Sanschagrin', 'margaux.anschagrin@gmail.com','0674893245');
insert into client (id_client, prenom, nom, mail, telephone) values (5, 'Didier', 'Lecadec', 'didier.leblanc@gmail.com','0645892103');
insert into client (id_client, prenom, nom, mail, telephone) values (6, 'Jules', 'Cloutier', 'jules.cloutier@gmail.com','0674951234');

insert into administrateur (id_admin, prenom, nom, mail, mot_de_passe, telephone) values (1, 'Natalie', 'Lagarde', 'natalie;lagarde@cinema.com', '1jDfj%hFGYSDGF%78hj', '0145796213');
insert into administrateur (id_admin, prenom, nom, mail, mot_de_passe, telephone) values (2, 'Roland', 'Guimond', 'gbenedicte0@cinema.com', 'hj7A8Ej%hFg54hgGF%454', '0145796871');
insert into administrateur (id_admin, prenom, nom, mail, mot_de_passe, telephone) values (3, 'Thomas', 'Torrins', 'gbenedicte0@cinema.com', '98d74fj%h30dfF%x5q', '0145792324');
insert into administrateur (id_admin, prenom, nom, mail, mot_de_passe, telephone) values (4, 'Elisabteh', 'Fouquet', 'elisabeth.fouquet0@cinema.com', 'hjSDfj%hlGY65GF%4f0', '0145792017');

insert into tarif (id_tarif, type_tarif, prix) values (1, 'plein tarif', 9.2);
insert into tarif (id_tarif, type_tarif, prix) values (2, 'étudiant', 7.6);
insert into tarif (id_tarif, type_tarif, prix) values (3, 'moins de 14 ans', 5.9);

insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (1, '2022-09-01', '10:00', 1, 1);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (2, '2022-09-01', '12:00', 1, 4);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (3, '2022-09-01', '19:30', 1, 5);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (4, '2022-09-01', '11:20', 2, 3);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (5, '2022-09-01', '13:00', 2, 8);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (6, '2022-09-01', '14:00', 2, 7);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (7, '2022-09-01', '15:30', 3, 6);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (8, '2022-09-01', '10:00', 3, 4);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (9, '2022-09-01', '10:30', 4, 1);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (10, '2022-09-01', '11:00', 4, 1);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (11, '2022-09-01', '11:50', 4, 8);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (12, '2022-09-01', '12:00', 4, 2);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (13, '2022-09-01', '17:10', 4, 3);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (14, '2022-09-01', '17:40', 4, 5);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (15, '2022-09-01', '20:00', 4, 7);
insert into seance (id_seance, date_seance, horaire_debut, id_cinema, id_film) values (16, '2022-09-01', '21:00', 4, 6);

insert into reservation (id_reservation, date_reservation, nombre_place, id_client, id_seance) values (1, '2022-09-01', 3, 2, 9);
insert into reservation (id_reservation, date_reservation, nombre_place, id_client, id_seance) values (2, '2022-09-01', 5, 1, 7);
insert into reservation (id_reservation, date_reservation, nombre_place, id_client, id_seance) values (3, '2022-09-01', 1, 4, 2);
insert into reservation (id_reservation, date_reservation, nombre_place, id_client, id_seance) values (4, '2022-09-01', 6, 3, 10);
insert into reservation (id_reservation, date_reservation, nombre_place, id_client, id_seance) values (5, '2022-09-01', 2, 7, 6);
insert into reservation (id_reservation, date_reservation, nombre_place, id_client, id_seance) values (6, '2022-09-01', 3, 8, 11);