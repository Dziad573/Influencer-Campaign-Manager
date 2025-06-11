const express = require('express');
const cors = require('cors');
const app = express();
const port = 3001;

app.use(cors({ origin: 'http://localhost:3000', credentials: true }));

const { sequelize, User, Campaign, Influencer, CampaignEffect, CampaignInfluencer, Payment } = require('./models');
const { where } = require('sequelize');
const { Op } = require('sequelize');

app.use(express.json());

sequelize.authenticate()
    .then(() => console.log('Sequelize connected'))
    .catch(err => console.error('Connect error:', err));


app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    

    try {
        const user = await User.findOne({
        where: { email, password_hash: password }
        });

        if (!user) return res.status(401).json({ message: 'Invalid data' });

        res.json({
        id: user.user_id,
        username: user.username,
        email: user.email,
        role: user.role
        });

    } catch (err) {
        console.error('Invalid login:', err);
    }
});

app.get('/campaigns/top_campaigns', async (req, res) => {
    try {
        const topCampaigns = await CampaignEffect.findAll({
            include: [{
                model: Campaign,
                attributes: ['campaign_id', 'name', 'description', 
                            'start_date', 'end_date', 'client']
            }],
            order: [['views', 'DESC']],
            limit: 3
        });

        res.json(topCampaigns);
    } catch (err) {
        console.error('Invalid campaign:', err);
    }
});

app.get('/campaigns/upcoming_campaigns', async (req, res) => {
    try {
        const upcomingCampaigns = await Campaign.findAll({
            include: [{
                model: CampaignInfluencer,
                attributes: ['campaign_id', 'influencer_id'],
                    include: [{
                        model: Influencer,
                        attributes: ['influencer_id', 'first_name', 'last_name' ]
                    }]
            }],
            order: [['start_date', 'ASC']],
            where: {
                status: 'Planned',
            }
        });

        res.json(upcomingCampaigns);
    } catch (err) {
        console.error('Invalid campaign:', err);
    }
});

app.get('/campaigns/completed_campaigns', async (req, res) => {
    try {
        const completedCampaigns = await Campaign.findAll({
            include: [{
                model: CampaignInfluencer,
                attributes: ['campaign_id', 'influencer_id'],
                    include: [{
                        model: Influencer,
                        attributes: ['influencer_id', 'first_name', 'last_name']
                    }]
            }],
            include: [{
                model: CampaignEffect,
                attributes: ['effect_id', 'influencer_id','views', 'likes', 'comments', 'shares', 'report_date']
            }],
            order: [['start_date', 'DESC']],
            where: {
                status: 'Completed',
            }
        });

        res.json(completedCampaigns);
    } catch (err) {
        console.error('Invalid campaign:', err);
    }
});


// const express = require('express');
// // const basicAuth = require('basic-auth');
// const mysql = require('mysql');
// const cors = require('cors');
// const bodyParser = require('body-parser');

// const app = express();
// const port = 3001;

// app.use(cors());
// app.use(bodyParser.json());

{/* Authentication */}
// function auth(req, res, next) {
//     const user = basicAuth(req);

//     const username = 'admin';
//     const password = 'admin';

//     if (!user || user.name !== username || user.pass !== password) {
//         res.set('WWW-Authenticate', 'Basic realm="Protected Area"');
//         return res.status(401).send('Access denied');
//     }
//     next();
// }



{/* MySQL connection */}
// const db = mysql.createConnection({
//     host: '127.0.0.1',
//     user: 'root',
//     password: '',
//     database: 'influencer_campaign_manager_db'
// });

// {/* Connecting to MySQL */}
// db.connect(err => {
//     if (err) return console.error('Błąd połączenia:', err);
//     console.log('Połączono z MySQL');
// });

// {/* Login endpoint */}
// app.post('/login', (req, res) => {
//     const { email, password } = req.body;

//     const query = `SELECT * FROM users WHERE email = ? AND password_hash = ?`;
//     db.query(query, [email, password], (err, results) => {
//         if (err) return res.status(500).send(err);
//         if (results.length === 0) {
//             return res.status(401).json({ message: 'Invalid credentials' });
//         }

//         const user = results[0];
//         const { user_id, username, role } = user;

//         res.json({ id: user_id, username, email, role });
//     });
// });

// {/* Fetch user by ID */}
// app.get('/users/:id', (req, res) => {
//     const { id } = req.params;

//     const query = `SELECT user_id, username, email, role FROM users WHERE user_id = ?`;
//     db.query(query, [id], (err, results) => {
//         if (err) return res.status(500).send(err);
//         if (results.length === 0) return res.status(404).json({ message: 'User not found' });
//         res.json(results[0]);
//     });
// });

// {/* Fetching all campaigns */}
// app.get('/campaigns', (_, res) => {
//     const query = `
//         SELECT * FROM campaigns;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching all campaign effects */}
// app.get('/campaign_effects', (_, res) => {
//     const query = `
//         SELECT * FROM campaign_effects;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching all campaign influencers */}
// app.get('/campaign_influencers', (_, res) => {
//     const query = `
//         SELECT * FROM campaign_influencers;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching all influencers */}
// app.get('/influencers', (_, res) => {
//     const query = `
//         SELECT * FROM influencers;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching all payments */}
// app.get('/payments', (_, res) => {
//     const query = `
//         SELECT * FROM payments;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching all users */}
// app.get('/users', (_, res) => {
//     const query = `
//         SELECT * FROM users;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching top campaigns */}
// app.get('/campaigns/top_campaigns', (_, res) => {
//     const query = `
//         SELECT * FROM campaign_effects 
//         INNER JOIN 
//         campaigns ON campaign_effects.campaign_id = campaigns.campaign_id 
//         ORDER BY campaign_effects.views DESC LIMIT 3;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching upcoming campaigns */}
// app.get('/campaigns/upcoming_campaigns', (_, res) => {
//     const query = `
//         SELECT * FROM campaigns 
//         WHERE status = 'Planned' AND start_date > NOW() 
//         ORDER BY start_date ASC;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching the total number of campaigns */}
// app.get('/campaigns/count', (_, res) => {
//     const query = `
//         SELECT COUNT(*) AS total_campaigns FROM campaigns;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching the total number of influencers */}
// app.get('/influencers/count', (_, res) => {
//     const query = `
//         SELECT COUNT(*) AS total_influencers FROM influencers;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });

// {/* Fetching the total number of likes across all campaigns */}
// app.get('/campaign_effects/likes/total', (_, res) => {
//     const query = `
//         SELECT SUM(likes) AS total_likes FROM campaign_effects;
//     `;
//     db.query(query, (err, results) => {
//         if (err) return res.status(500).send(err);
//         res.json(results);
//     });
// });


app.listen(port, () => {
    console.log(`Backend works at http://localhost:${port}`);
});