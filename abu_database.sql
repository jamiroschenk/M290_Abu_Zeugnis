-- Datenbank erstellen
CREATE DATABASE IF NOT EXISTS schulzeugnis;

USE schulzeugnis;

-- Tabelle für Schüler erstellen
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