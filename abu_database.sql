-- Datenbank wurde erstellt
CREATE DATABASE IF NOT EXISTS schulzeugnis;

USE schulzeugnis;

-- Tabelle mit Vor und Nachnamen. Sie sind gleich der Klasse zugeordnet
CREATE TABLE IF NOT EXISTS schueler (
                                        schueler_id INT AUTO_INCREMENT PRIMARY KEY,
                                        vorname VARCHAR(50) NOT NULL,
                                        nachname VARCHAR(50) NOT NULL,
                                        klasse VARCHAR(10) NOT NULL
);

-- Einträge für die Tabelle "schueler" einfügen
INSERT INTO schueler (vorname, nachname, klasse) VALUES
                                                     ('Max', 'Mustermann', 'ME23A'),
                                                     ('Anna', 'Musterfrau', 'ME23B'),
                                                     ('Tom', 'Schmidt', 'ME22A'),
                                                     ('Julia', 'Schulz', 'ME22B'),
                                                     ('David', 'Wagner', 'ME22B'),
                                                     ('Laura', 'Müller', 'ME22A'),
                                                     ('Daniel', 'Becker', 'ME23B'),
                                                     ('Sophie', 'Koch', 'ME22A'),
                                                     ('Michael', 'Bauer', 'ME23A'),
                                                     ('Emma', 'Hoffmann', 'ME23B');

SELECT * FROM schueler;

-- Tabelle für Noten erstellen
CREATE TABLE IF NOT EXISTS noten (
                                     note_id INT AUTO_INCREMENT PRIMARY KEY,
                                     schueler_id INT,
                                     fach VARCHAR(50) NOT NULL,
                                     note DECIMAL(2, 1) NOT NULL,
                                     erstellungsdatum DATE NOT NULL,
                                     letzte_aktualisierung DATE NOT NULL,
                                     FOREIGN KEY (schueler_id) REFERENCES schueler(schueler_id)
);

-- Noten für Schüler eintragen
-- Beachte: schueler_id 1 bis 10 repräsentieren die ersten 10 Schüler in der Tabelle "schueler"

-- Schüler 1 (Max Mustermann)
INSERT INTO noten (schueler_id, fach, note, erstellungsdatum, letzte_aktualisierung)
VALUES (1, 'Abu', 4.0, '2023-01-01', '2023-01-01');

-- Schüler 2 (Anna Musterfrau)
INSERT INTO noten (schueler_id, fach, note, erstellungsdatum, letzte_aktualisierung)
VALUES (2, 'Abu', 3.5, '2023-01-02', '2023-01-02');

-- Schüler 3 (Tom Schmidt)
INSERT INTO noten (schueler_id, fach, note, erstellungsdatum, letzte_aktualisierung)
VALUES (3, 'Abu', 5.0, '2023-01-03', '2023-01-03');

-- ... Fortfahren, um Noten für die anderen Fächer und Schüler hinzuzufügen

-- Noten für Abu
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Abu';

-- Noten für Sport
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Sport';

-- Noten für Marketingfachsprache
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Marketingfachsprache';

-- Noten für Englisch
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Englisch';

-- Schülernamen und Noten für jedes Fach auswählen
SELECT
    s.vorname,
    s.nachname,
    n.fach,
    n.note
FROM
    schueler s
        JOIN
    noten n ON s.schueler_id = n.schueler_id;



-- Noten für Abu
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Abu';

-- Noten für Sport
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Sport';

-- Noten für Marketingfachsprache
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Marketingfachsprache';

-- Noten für Englisch
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Englisch';


-- Wiederhole dies für jede schueler_id von 1 bis 10
-- Noten für Abu
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Abu' AND schueler_id = 1;

-- Noten für Sport
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Sport' AND schueler_id = 1;

-- Noten für Marketingfachsprache
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Marketingfachsprache' AND schueler_id = 1;

-- Noten für Englisch
UPDATE noten SET note = ROUND(RAND() * 2 + 4, 1) WHERE fach = 'Englisch' AND schueler_id = 1;

-- Wiederhole dies für jede schueler_id von 2 bis 10
-- ...

-- Schülernamen und Sportnoten auswählen
SELECT
    s.vorname,
    s.nachname,
    n.note AS sportnote
FROM
    schueler s
        JOIN
    noten n ON s.schueler_id = n.schueler_id
WHERE
        n.fach = 'Sport';

select * from noten




DROP TABLE IF EXISTS noten;

-- Tabelle für Abu-Noten erstellen
CREATE TABLE IF NOT EXISTS abu_noten (
                                         abu_note_id INT AUTO_INCREMENT PRIMARY KEY,
                                         schueler_id INT,
                                         note DECIMAL(2, 1) NOT NULL,
                                         erstellungsdatum DATE NOT NULL,
                                         letzte_aktualisierung DATE NOT NULL,
                                         FOREIGN KEY (schueler_id) REFERENCES schueler(schueler_id)
);

-- Noten für Abu für die ersten 10 Schüler eintragen
INSERT INTO abu_noten (schueler_id, note, erstellungsdatum, letzte_aktualisierung)
VALUES
    (1, 4.5, '2023-01-01', '2023-01-01'),
    (2, 5.2, '2023-01-02', '2023-01-02'),
    (3, 4.8, '2023-01-03', '2023-01-03'),
    (4, 5.5, '2023-01-04', '2023-01-04'),
    (5, 5.0, '2023-01-05', '2023-01-05'),
    (6, 4.3, '2023-01-06', '2023-01-06'),
    (7, 5.8, '2023-01-07', '2023-01-07'),
    (8, 4.7, '2023-01-08', '2023-01-08'),
    (9, 5.3, '2023-01-09', '2023-01-09'),
    (10, 4.9, '2023-01-10', '2023-01-10');

select * from abu_noten

-- Tabelle für Sport-Noten erstellen
CREATE TABLE IF NOT EXISTS sport_noten (
                                           sport_note_id INT AUTO_INCREMENT PRIMARY KEY,
                                           schueler_id INT,
                                           note DECIMAL(2, 1) NOT NULL,
                                           erstellungsdatum DATE NOT NULL,
                                           letzte_aktualisierung DATE NOT NULL,
                                           FOREIGN KEY (schueler_id) REFERENCES schueler(schueler_id)
);

-- Noten für Sport für die ersten 10 Schüler eintragen
INSERT INTO sport_noten (schueler_id, note, erstellungsdatum, letzte_aktualisierung)
VALUES
    (1, 5.7, '2023-01-01', '2023-01-01'),
    (2, 4.5, '2023-01-02', '2023-01-02'),
    (3, 5.0, '2023-01-03', '2023-01-03'),
    (4, 6.0, '2023-01-04', '2023-01-04'),
    (5, 4.8, '2023-01-05', '2023-01-05'),
    (6, 5.2, '2023-01-06', '2023-01-06'),
    (7, 4.6, '2023-01-07', '2023-01-07'),
    (8, 5.5, '2023-01-08', '2023-01-08'),
    (9, 4.9, '2023-01-09', '2023-01-09'),
    (10, 5.3, '2023-01-10', '2023-01-10');

select * from sport_noten

-- Tabelle für Marketingfachsprache-Noten erstellen
CREATE TABLE IF NOT EXISTS marketingfachsprache_noten (
                                                          marketingfachsprache_note_id INT AUTO_INCREMENT PRIMARY KEY,
                                                          schueler_id INT,
                                                          note DECIMAL(2, 1) NOT NULL,
                                                          erstellungsdatum DATE NOT NULL,
                                                          letzte_aktualisierung DATE NOT NULL,
                                                          FOREIGN KEY (schueler_id) REFERENCES schueler(schueler_id)
);

-- Noten für Marketingfachsprache für die ersten 10 Schüler eintragen
INSERT INTO marketingfachsprache_noten (schueler_id, note, erstellungsdatum, letzte_aktualisierung)
VALUES
    (1, 4.2, '2023-01-01', '2023-01-01'),
    (2, 5.5, '2023-01-02', '2023-01-02'),
    (3, 4.8, '2023-01-03', '2023-01-03'),
    (4, 5.9, '2023-01-04', '2023-01-04'),
    (5, 4.5, '2023-01-05', '2023-01-05'),
    (6, 5.3, '2023-01-06', '2023-01-06'),
    (7, 4.7, '2023-01-07', '2023-01-07'),
    (8, 5.0, '2023-01-08', '2023-01-08'),
    (9, 4.6, '2023-01-09', '2023-01-09'),
    (10, 5.2, '2023-01-10', '2023-01-10');

select * from marketingfachsprache_noten


-- Tabelle für Englisch-Noten erstellen
CREATE TABLE IF NOT EXISTS englisch_noten (
                                              englisch_note_id INT AUTO_INCREMENT PRIMARY KEY,
                                              schueler_id INT,
                                              note DECIMAL(2, 1) NOT NULL,
                                              erstellungsdatum DATE NOT NULL,
                                              letzte_aktualisierung DATE NOT NULL,
                                              FOREIGN KEY (schueler_id) REFERENCES schueler(schueler_id)
);

-- Noten für Englisch für die ersten 10 Schüler eintragen
INSERT INTO englisch_noten (schueler_id, note, erstellungsdatum, letzte_aktualisierung)
VALUES
    (1, 5.4, '2023-01-01', '2023-01-01'),
    (2, 4.7, '2023-01-02', '2023-01-02'),
    (3, 5.1, '2023-01-03', '2023-01-03'),
    (4, 4.9, '2023-01-04', '2023-01-04'),
    (5, 5.8, '2023-01-05', '2023-01-05'),
    (6, 4.5, '2023-01-06', '2023-01-06'),
    (7, 5.0, '2023-01-07', '2023-01-07'),
    (8, 4.3, '2023-01-08', '2023-01-08'),
    (9, 5.7, '2023-01-09', '2023-01-09'),
    (10, 4.6, '2023-01-10', '2023-01-10');

select * from englisch_noten

select * from schueler

select * from marketingfachsprache_noten

select * from schueler

-- Beispiel für die Tabelle "abu_noten"
SELECT
    s.vorname,
    s.nachname,
    n.note AS abu_note
FROM
    schueler s
        JOIN
    abu_noten n ON s.schueler_id = n.schueler_id
WHERE
        s.klasse = 'ME22A';

-- Noten für alle Fächer der Klasse "ME22A" auswählen
SELECT
    s.vorname,
    s.nachname,
    a.note AS abu_note,
    sp.note AS sport_note,
    m.note AS marketingfachsprache_note,
    e.note AS englisch_note
FROM
    schueler s
        LEFT JOIN
    abu_noten a ON s.schueler_id = a.schueler_id
        LEFT JOIN
    sport_noten sp ON s.schueler_id = sp.schueler_id
        LEFT JOIN
    marketingfachsprache_noten m ON s.schueler_id = m.schueler_id
        LEFT JOIN
    englisch_noten e ON s.schueler_id = e.schueler_id
WHERE
        s.klasse = 'ME22A';

select * from sport_noten

select * from schueler












-- Demonstration für die Präsentation

-- Komplexer Select auf die Datenbank
-- Hier zeigen wir einen Select unter Miteinbezug von je einer Basistabelle

select * from schueler;

-- 2 Pkt: Anwendung von mindestens  joins (Verbindung zwischen den Tabellen mittels PK Und FK.
-- Mit Left Join kombinieren wir die Daten aus mehreren Tabellen in einer
SELECT
    s.vorname,
    s.nachname,
    a.note AS abu_note,
    sp.note AS sport_note,
    m.note AS marketingfachsprache_note,
    e.note AS englisch_note
FROM
    schueler s
        LEFT JOIN
    abu_noten a ON s.schueler_id = a.schueler_id
        LEFT JOIN
    sport_noten sp ON s.schueler_id = sp.schueler_id
        LEFT JOIN
    marketingfachsprache_noten m ON s.schueler_id = m.schueler_id
        LEFT JOIN
    englisch_noten e ON s.schueler_id = e.schueler_id
WHERE
        s.klasse = 'ME22B';

-- 1 Pkt: Demonstration der auf- und absteigende Sortierung
-- Aufsteigende Sortierung nach Nachnamen (ACS = Aufstieg) (DESC = Absteigend)
SELECT * FROM schueler
ORDER BY nachname ASC;


-- CRUD-Operationen auf der Datenbank: INSERT
-- 1 Pkt: Kann einen Insert auf eine Basistabelle ausführen.
-- Mit Insert können wir neue Daten in eine Tabelle einfügen
INSERT INTO schueler (vorname, nachname, klasse)
VALUES ('Lenny', 'Werrn', 'ME22A');

select * from schueler

-- 1 Pkt: Kann mit einem Insert mehrere Daten in die Basistabellen einfügen.
-- Mehrere neue Schüler werden eingefügt
INSERT INTO schueler (vorname, nachname, klasse)
VALUES
    ('Maria', 'Fischer', 'ME22A'),
    ('Benjamin', 'Blümchen', 'ME22A'),
    ('Dagobert', 'Duck', 'ME22B'),
    ('Thierry', 'Biland', 'ME22B');

select * from schueler


-- CRUD-Operationen auf der Datenbank: SELECT
-- 1 Pkt: Kann Select auf Basidaten ausführen

SELECT vorname, nachname, klasse
FROM schueler;

-- 3 Pkt: Kann Select auf Relationentabellen machen und die Attribute der Fremdtabelle anzeigen lassen.
-- Hier wollen wir alle Abu Noten anzeigen (funktioniert noch nicht)
-- s. steht für Schüler - es ist eine abkürzung

SELECT
    s.vorname,
    s.nachname,
    s.klasse,
    a.note AS abu_note
FROM
    schueler s
        JOIN
    abu_noten a ON s.schueler_id = a.schueler_id
WHERE
        s.klasse = 'ME22A';

select * from schueler

-- CRUD-Operationen auf der Datenbank: UPDATE
-- 1 Pkt: Kann Update auf eine Basistabelle ausführen

-- Wir wechseln den Schüler mit der Schüler ID 1 in eine andere Klasse
-- Hier ändern wir die Basis Tabelle
UPDATE schueler
SET klasse = 'ME22B'
WHERE schueler_id = 1;

select * from schueler

-- 1 Pkt: Kann beim Update geziehlt einen Datensatz aktualisieren
-- Hier ändern wir jetzt die Sport Note aus einer Untertabelle

-- Update, um gezielt die Sportnote für einen Schüler zu aktualisieren
UPDATE sport_noten
SET note = 6
WHERE schueler_id = 1;

select * from sport_noten


-- CRUD-Operationen auf der Datenbank: DELETE
-- 1 Pkt: Kann einen DELETE auf eine Basistabelle ausführen.

-- hier löschen wir die Entität aus einer Basistabelle (Entität=Schüler)
DELETE FROM schueler
WHERE schueler_id = 20;

select * from schueler

-- 1 Pkt: Kann einen geziehlten DELETE (auf einen oder weniger Sätze beschränkt) ausführen.

INSERT INTO schueler (vorname, nachname, klasse)
VALUES
    ('Thierry', 'Biland', 'ME22B');

select * from schueler

DELETE FROM sport_noten
WHERE schueler_id = 9;

select * from sport_noten
