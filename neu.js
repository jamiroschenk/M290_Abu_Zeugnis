/* *******************************************************************************************
* Autor: V. Demir, 1/2024
* *******************************************************************************************
* Beschreibung:
* Express-Server, um CRUD-Operationen vom Browser entgegen zunehmen an der DB durchzuführen
* *******************************************************************************************
* Hinweise
* npm install node
* npm init -y
* npm install mysql2
* npm install body-parser
* npm install express
** ***************************************************************************************** */
// Referenz: www.npmjs.com/package/mysql

const mysql = require("mysql2");
const cors = require('cors');
const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser');

const port = 3000;

app.use(cors());

const pool = mysql.createPool({
    host: 'localhost',
    database: 'schulzeugnis',
    user: "root",
    password: '8484WeisslingenSchule!',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

app.get('/schueler', (req, res) => {
    pool.query('SELECT * FROM schueler', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});
app.get('/schueler/:id', (req, res) => {
    pool.query('SELECT * FROM schueler WHERE schueler_id = ?', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});

app.delete('/schueler/:id', (req, res) => {
    pool.query(' DELETE FROM schueler WHERE schueler_id = ? ', [req.params.id], (err, rows, fields) => {
        if (!err) {
            res.send('Delete operation was successful')
            // res.send(rows)
        } else {
            console.log(err);
        }

    })
})