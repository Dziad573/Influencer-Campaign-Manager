module.exports = (sequelize, DataTypes) => {
    return sequelize.define('User', {
        user_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
        username: { type: DataTypes.STRING(255), unique: true, allowNull: false },
        password_hash: { type: DataTypes.STRING(255), allowNull: false },
        email: { type: DataTypes.STRING(320), unique: true, allowNull: false },
        role: { type: DataTypes.ENUM('admin','manager','influencer','viewer'), allowNull: false },
        created_at: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
        icon: { type: DataTypes.STRING(255), allowNull: true },
    }, {
        tableName: 'users',
        timestamps: false
    });
};