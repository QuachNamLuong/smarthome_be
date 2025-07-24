/**
 * Defines the CartServiceItem model representing the `cart_service_items` table in the database.
 *
 * @param {import("sequelize").Sequelize} sequelize - The Sequelize instance.
 * @param {typeof import("sequelize").DataTypes} DataTypes - The Sequelize DataTypes object.
 * @returns {import("sequelize").Model} The Sequelize model for the `cart_service_items` table.
 */
module.exports = (sequelize, DataTypes) => {
  const CartServiceItem = sequelize.define("CartServiceItem", {
    cart_item_service_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    cartitem_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    package_service_item_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    service_id: {
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
    tableName: "cart_service_items",
    timestamps: false,
    underscored: true
  });

  return CartServiceItem;
};
