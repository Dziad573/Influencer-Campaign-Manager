module.exports = (sequelize, DataTypes) => {
    return sequelize.define('CampaignInfluencer', {
        id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        campaign_id: { type: DataTypes.INTEGER, allowNull: false },
        influencer_id: { type: DataTypes.INTEGER, allowNull: true },
        agreed_fee: { type: DataTypes.DECIMAL(10,2), allowNull: false },
        contract_signed: { type: DataTypes.BOOLEAN, allowNull: false },
        notes: { type: DataTypes.TEXT, allowNull: true },
    }, {
        tableName: 'campaign_influencers',
        timestamps: false
    });
};