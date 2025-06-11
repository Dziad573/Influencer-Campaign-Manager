module.exports = (sequelize, DataTypes) => {
    return sequelize.define('Campaign', {
        campaign_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        name: { type: DataTypes.STRING(255), allowNull: false },
        client: { type: DataTypes.STRING(255), allowNull: false },
        start_date: { type: DataTypes.DATEONLY, allowNull: false },
        end_date: { type: DataTypes.DATEONLY, allowNull: false },
        budget: { type: DataTypes.DECIMAL(12,2), allowNull: false },
        goal_description: { type: DataTypes.TEXT, allowNull: true },
        status: { type: DataTypes.ENUM('Planned','Ongoing','Completed','Cancelled'), allowNull: false },
        description: { type: DataTypes.TEXT, allowNull: false },
    }, {
        tableName: 'campaigns',
        timestamps: false
    });
};