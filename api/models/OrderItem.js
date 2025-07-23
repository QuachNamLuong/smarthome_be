module.exports = (sequelize, Sequelize) => {
  const OrderItem = sequelize.define('OrderItem', {
    order_item_id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    order_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    variant_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    quantity: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    price_at_purchase: {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: false,
    },
    total_item_price: {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: false,
    },
    item_status: {
      type: Sequelize.STRING(50),
      defaultValue: 'pending',
    },
  }, {
    tableName: 'orderitems',
    timestamps: false,
  });

  return OrderItem;
};