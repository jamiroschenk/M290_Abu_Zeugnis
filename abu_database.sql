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
