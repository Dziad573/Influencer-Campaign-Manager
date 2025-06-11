module.exports = (sequelize, DataTypes) => {
    return sequelize.define('Platform', {
        platform_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        name: { type: DataTypes.STRING(255), unique: true,allowNull: false },
        client: { type: DataTypes.STRING(255), allowNull: false },
        url_template: { type: DataTypes.STRING(255), allowNull: false },
        description: { type: DataTypes.TEXT, allowNull: false },
    }, {
        tableName: 'platforms',
        timestamps: false
    });
};