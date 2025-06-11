module.exports = (sequelize, DataTypes) => {
    return sequelize.define('CampaignEffect', {
        effect_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        campaign_id: { type: DataTypes.INTEGER, allowNull: false },
        influencer_id: { type: DataTypes.INTEGER, allowNull: false },
        views: { type: DataTypes.INTEGER, allowNull: false },
        likes: { type: DataTypes.INTEGER, allowNull: false },
        comments: { type: DataTypes.INTEGER, allowNull: false },
        shares: { type: DataTypes.INTEGER, allowNull: false },
        report_date: { type: DataTypes.DATEONLY, allowNull: true },
        
    }, {
        tableName: 'campaign_effects',
        timestamps: false
    });
};