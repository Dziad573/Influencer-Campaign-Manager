module.exports = (sequelize, DataTypes) => {
    return sequelize.define('InfluencerPlatform', {
        influencer_id: { type: DataTypes.INTEGER, autoIncrement: false, primaryKey: true },
        platform_id: { type: DataTypes.INTEGER, autoIncrement: false, primaryKey: true },
        follows: { type: DataTypes.BIGINT, allowNull: false },
        account_url: { type: DataTypes.STRING(255), allowNull: true },
        platform_username: { type: DataTypes.STRING(255), allowNull: false },
        joined_date: { type: DataTypes.DATEONLY, allowNull: true },
    }, {
        tableName: 'influencer_platforms',
        timestamps: false
    });
};