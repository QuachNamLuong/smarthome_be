module.exports = (sequelize, Sequelize) => {
  const OrderServiceItem = sequelize.define(
    "OrderServiceItem",
    {
      order_item_service_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true, // change to true if needed
      },
      order_item_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      package_service_item_id: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      price: {
        type: Sequelize.DECIMAL(10, 2),
        defaultValue: 0.0,
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
        onUpdate: sequelize.literal("CURRENT_TIMESTAMP"),
      },
    },
    {
      tableName: "orderitemservices",
      timestamps: false,
      underscored: true,
    }
  );

  return OrderServiceItem;
};