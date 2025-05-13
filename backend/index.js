const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const port = 3001;

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'influencer_campaign_manager_db'
});

db.connect(err => {
    if (err) return console.error('Błąd połączenia:', err);
    console.log('Połączono z MySQL');
});

app.get('/campaigns', (_, res) => {
    const query = `
        SELECT * FROM campaigns
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.get('/campaign_effects', (_, res) => {
    const query = `
        SELECT * FROM campaign_effects
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.get('/campaign_influencers', (_, res) => {
    const query = `
        SELECT * FROM campaign_influencers
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.get('/influencers', (_, res) => {
    const query = `
        SELECT * FROM influencers
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.get('/payments', (_, res) => {
    const query = `
        SELECT * FROM payments
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.get('/users', (_, res) => {
    const query = `
        SELECT * FROM users
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.listen(port, () => {
    console.log(`Backend działa na http://localhost:${port}`);
});