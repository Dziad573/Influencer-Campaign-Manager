const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('influ', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false,
});

module.exports = sequelize;