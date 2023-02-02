DROP TABLE IF EXISTS Filiaal CASCADE;
DROP TABLE IF EXISTS Book CASCADE;
DROP TABLE IF EXISTS Uitgever CASCADE;
DROP TABLE IF EXISTS Auteur CASCADE;
DROP TABLE IF EXISTS Klant CASCADE;
DROP TABLE IF EXISTS Winkelwagen CASCADE;
DROP TABLE IF EXISTS Storebook CASCADE;

CREATE TABLE Filiaal(
    id INT PRIMARY KEY,
    adres VARCHAR(255) NOT NULL,
    plaats VARCHAR (255) NOT NULL,
    telefoonnummer VARCHAR(255) NOT NULL
);

CREATE TABLE Book(
isbn INT PRIMARY KEY,
uitgave_jaar DATE,
titel VARCHAR(255) NOT NULL,
auteurid INT,
uitgeverid INT,
prijs FLOAT NOT NULL
);

CREATE TABLE Uitgever(
    id int PRIMARY KEY,
    naam VARCHAR (255) NOT NULL,
    adres VARCHAR (255) NOT NULL,
    plaats VARCHAR (255) NOT NULL,
    telefoonnummer VARCHAR(255) NOT NULL,
    website_url VARCHAR(255) UNIQUE
);

CREATE TABLE Auteur(
    id INT PRIMARY KEY,
    naam VARCHAR(255) NOT NULL,
    geboortejaar TIMESTAMP,
    wiki_url VARCHAR(255) UNIQUE
);

CREATE TABLE Klant(
    id INT PRIMARY KEY,
    naam VARCHAR(255) NOT NULL,
    e_mail VARCHAR(255) NOT NULL UNIQUE,
    telefoonnummer VARCHAR(255),
    adres VARCHAR (255) NOT NULL,
    plaats VARCHAR (255) NOT NULL
);

CREATE TABLE Winkelwagen(
    id int PRIMARY KEY,
    storebook_id int,
    klant_id int,
    amount int
);

CREATE TABLE Storebook(
    id int PRIMARY KEY,
    store_id int NOT NULL,
    book_isbn int NOT NULL,
    amount int
);

ALTER TABLE Winkelwagen 
ADD CONSTRAINT fk_wagenstorebook 
FOREIGN KEY (storebook_id) REFERENCES Storebook(id);

ALTER TABLE Winkelwagen 
ADD CONSTRAINT fk_winkelwagenklantid 
FOREIGN KEY (klant_id) REFERENCES Klant(id);

ALTER TABLE Storebook
ADD CONSTRAINT fk_storebookfiliaal 
FOREIGN KEY (store_id) REFERENCES Filiaal(id);

ALTER TABLE Storebook
ADD CONSTRAINT fk_storebookisbn 
FOREIGN KEY (book_isbn) REFERENCES Book(isbn);

ALTER TABLE Book
ADD CONSTRAINT fk_bookauteur
FOREIGN KEY (auteurid) REFERENCES Auteur(id);

ALTER TABLE Book
ADD CONSTRAINT fk_bookuitgever
FOREIGN KEY (uitgeverid) REFERENCES Uitgever(id)