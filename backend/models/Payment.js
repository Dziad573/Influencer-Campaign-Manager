module.exports = (sequelize, DataTypes) => {
    return sequelize.define('Payment', {
        payment_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        influencer_id: { type: DataTypes.INTEGER, allowNull: false },
        campaign_id: { type: DataTypes.INTEGER, allowNull: false },
        amount: { type: DataTypes.DECIMAL(10,2), allowNull: false },
        payment_date: { type: DataTypes.DATEONLY, allowNull: false },
        status: { type: DataTypes.ENUM('Pending','Paid','Failed'), allowNull: false },
    }, {
        tableName: 'payments',
        timestamps: false
    });
};