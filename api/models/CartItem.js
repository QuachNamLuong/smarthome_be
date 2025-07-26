module.exports = (sequelize, Sequelize) => {
  const CartItem = sequelize.define(
    "CartItem",
    {
      cart_item_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      cart_id: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      variant_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      quantity: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      created_at: {
        type: Sequelize.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      },
      updated_at: {
        type: Sequelize.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      },
    },
    {
      tableName: "cartitems",
      timestamps: false,
      indexes: [
        {
          unique: true,
          fields: ["user_id", "variant_id"],
        },
        {
          unique: true,
          fields: ["session_id", "variant_id"],
        },
        {
          fields: ["variant_id"],
        },
      ],
    }
  );

  return CartItem;
};
