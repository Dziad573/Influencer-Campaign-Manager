module.exports = (sequelize, DataTypes) => {
    return sequelize.define('Influencer', {
        influencer_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        first_name: { type: DataTypes.STRING(100), allowNull: false },
        last_name: { type: DataTypes.STRING(100), allowNull: false },
        email: { type: DataTypes.STRING(320), unique: true, allowNull: false },
        phone: { type: DataTypes.STRING(50), unique: true, allowNull: false },
        engagement_rate: { type: DataTypes.DECIMAL(5,2), allowNull: true },
        notes: { type: DataTypes.TEXT, allowNull: true },
        user_id: { type: DataTypes.INTEGER, allowNull: false }
    }, {
        tableName: 'influencers',
        timestamps: false
    });
};