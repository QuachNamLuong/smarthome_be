/**
 * Defines the Cart model representing the `carts` table in the database.
 *
 * @param {import("sequelize").Sequelize} sequelize - The Sequelize instance.
 * @param {typeof import("sequelize")} Sequelize - The Sequelize library with data types.
 * @returns {import("sequelize").Model} The Sequelize model for the `carts` table.
 */
module.exports = (sequelize, Sequelize) => {
  const Cart = sequelize.define(
    "carts",
    {
      cart_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      user_id: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      session_id: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: sequelize.literal(
          "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"
        ),
      },
    },
    {
      tableName: "carts",
      timestamps: false,
    }
  );

  return Cart;
};
