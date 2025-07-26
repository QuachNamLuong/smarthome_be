module.exports = (sequelize, DataTypes) => {
  const CartItemService = sequelize.define("CartServiceItem", {
    cart_item_service_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    cart_item_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    package_service_item_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    price: {
      type: DataTypes.DECIMAL(10, 2),
      defaultValue: 0.00
    },
    created_at: {
      type: DataTypes.DATE,
      defaultValue: sequelize.literal("CURRENT_TIMESTAMP")
    },
    updated_at: {
      type: DataTypes.DATE,
      defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      onUpdate: sequelize.literal("CURRENT_TIMESTAMP")
    }
  }, {
    tableName: "cartitemservices",
    timestamps: false,
    underscored: true
  });

  return CartItemService;
};
