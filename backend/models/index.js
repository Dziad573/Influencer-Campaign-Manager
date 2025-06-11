const Sequelize = require('sequelize');
const sequelize = require('../config/database');

const User = require('./User')(sequelize, Sequelize);
const Influencer = require('./Influencer')(sequelize, Sequelize);
const Campaign = require('./Campaign')(sequelize, Sequelize);
const CampaignInfluencer = require('./CampaignInfluencer')(sequelize, Sequelize);
const CampaignEffect = require('./CampaignEffect')(sequelize, Sequelize);
const Payment = require('./Payment')(sequelize, Sequelize);

User.hasOne(Influencer, { foreignKey: 'user_id' });
Influencer.belongsTo(User, { foreignKey: 'user_id' });

Campaign.hasMany(CampaignInfluencer, { foreignKey: 'campaign_id' });
CampaignInfluencer.belongsTo(Campaign, { foreignKey: 'campaign_id' });
Influencer.hasMany(CampaignInfluencer, { foreignKey: 'influencer_id' });
CampaignInfluencer.belongsTo(Influencer, { foreignKey: 'influencer_id' });

Campaign.hasMany(CampaignEffect, { foreignKey: 'campaign_id' });
CampaignEffect.belongsTo(Campaign, { foreignKey: 'campaign_id' });
// Influencer.hasMany(CampaignEffect, { foreignKey: 'influencer_id' });
// CampaignEffect.belongsTo(Influencer, { foreignKey: 'influencer_id' });

Campaign.hasMany(Payment, { foreignKey: 'campaign_id' });
Payment.belongsTo(Campaign, { foreignKey: 'campaign_id' });
Influencer.hasMany(Payment, { foreignKey: 'influencer_id' });
Payment.belongsTo(Influencer, { foreignKey: 'influencer_id' });

module.exports = {
    sequelize,
    User,
    Influencer,
    Campaign,
    CampaignInfluencer,
    CampaignEffect,
    Payment
};