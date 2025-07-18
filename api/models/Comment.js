module.exports = (sequelize) => {
  const Comment = sequelize.define('comments', {
    comment_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    product_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    parent_comment_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    comment_text: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    created_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    },
    updated_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    },
    status: {
      type: DataTypes.STRING(50),
      defaultValue: 'pending'
    }
  }, {
    tableName: 'comments',
    timestamps: false,
    underscored: true
  });
};