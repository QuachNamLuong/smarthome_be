module.exports = (sequelize, Sequelize) => {
  const Order = sequelize.define("Order", {
    order_id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    user_id: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
    guest_name: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    guest_email: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    shipping_address: {
      type: Sequelize.TEXT,
      allowNull: false,
    },
    shipping_phone: {
      type: Sequelize.STRING(20),
      allowNull: false,
    },
    order_total: {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: false,
    },
    order_status: {
      type: Sequelize.STRING(50),
      allowNull: false,
      defaultValue: "pending",
    },
    payment_method: {
      type: Sequelize.STRING(50),
      allowNull: true,
    },
    payment_status: {
      type: Sequelize.STRING(50),
      defaultValue: "unpaid",
    },
    shipping_cost: {
      type: Sequelize.DECIMAL(10, 2),
      defaultValue: 0.0,
    },
    coupon_code: {
      type: Sequelize.STRING(50),
      allowNull: true,
    },
    discount_amount: {
      type: Sequelize.DECIMAL(10, 2),
      defaultValue: 0.0,
    },
    ordered_at: {
      type: Sequelize.DATE,
      defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
    },
    updated_at: {
      type: Sequelize.DATE,
      defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
    },
    tracking_number: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    notes: {
      type: Sequelize.TEXT,
      allowNull: true,
    },
  }, {
    tableName: "orders",
    timestamps: false,
  });

  return Order;
};
