/* *******************************************************************************************
* Autor: Jamiro Schenk / Lenny Werrn
* *******************************************************************************************
* Beschreibung:
* Kommunikation zwischen der mySQL Datenbank und Postman
* *******************************************************************************************
* Hinweise
* npm install node
* npm init -y
* npm install mysql2
* npm install body-parser
* npm install express
** ***************************************************************************************** */
// Importieren der erforderlichen Pakete
const mysql = require("mysql2"); // Paket für MySQL-Datenbankverbindung
const cors = require('cors'); // Paket für Cross-Origin Resource Sharing (CORS)
const express = require('express'); // Paket für das Erstellen von Webservern mit Express.js
const app = express(); // Erstellen einer Express-App
const bodyParser = require('body-parser'); // Paket zum Parsen von Anfragenkörpern
const path = require('path'); // Paket für das Arbeiten mit Dateipfaden

// Konfiguration des Server-Ports
const port = 3000;

// Aktivieren von CORS in der Express-App
app.use(cors());

// Konfiguration einer MySQL-Pool-Verbindung
const pool = mysql.createPool({
    host: 'localhost',
    database: 'schulzeugnis',
    user: "root",
    password: '8484WeisslingenSchule!',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Starten des Servers und Ausgabe einer Bestätigungsnachricht
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

// Routen-Handler für GET-Anforderungen an "/schueler"
app.get('/schueler', (req, res) => {
    // Abfrage an die Datenbank, um alle Schüler abzurufen
    pool.query('SELECT * FROM schueler', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows); // Ausgabe der abgerufenen Datensätze
            res.send(rows); // Senden der abgerufenen Datensätze als Antwort
        } else {
            console.log(err); // Ausgabe von Fehlern, falls welche auftreten
        }
    })
});

// Routen-Handler für GET-Anforderungen an "/schueler/:id"
app.get('/schueler/:id', (req, res) => {
    // Abfrage an die Datenbank, um einen bestimmten Schüler basierend auf der übergebenen ID abzurufen
    pool.query('SELECT * FROM schueler WHERE schueler_id = ?', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows); // Ausgabe des abgerufenen Datensatzes
            res.send(rows); // Senden des abgerufenen Datensatzes als Antwort
        } else {
            console.log(err); // Ausgabe von Fehlern, falls welche auftreten
        }
    })
});

// Routen-Handler für DELETE-Anforderungen an "/schueler/:id"
app.delete('/schueler/:id', (req, res) => {
    // Durchführen einer Löschoperation für einen bestimmten Schüler basierend auf der übergebenen ID
    pool.query(' DELETE FROM schueler WHERE schueler_id = ? ', [req.params.id], (err, rows, fields) => {
        if (!err) {
            res.send('Delete operation was successful') // Senden einer Bestätigungsnachricht bei erfolgreicher Löschung
            // res.send(rows) // Möglicherweise können auch die gelöschten Datensätze als Antwort gesendet werden
        } else {
            console.log(err); // Ausgabe von Fehlern, falls welche auftreten
        }
    })
});




