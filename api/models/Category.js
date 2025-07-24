/**
 * Defines the Category model representing the `categories` table in the database.
 *
 * @param {import("sequelize").Sequelize} sequelize - The Sequelize instance.
 * @param {typeof import("sequelize")} Sequelize - The Sequelize library.
 * @returns {import("sequelize").Model} The Sequelize model for the `categories` table.
 */
module.exports = (sequelize, Sequelize) => {
  const Category = sequelize.define(
    "categories",
    {
      category_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      category_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
      },
      display_order: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
    },
    {
      timestamps: false,
      tableName: "categories",
    }
  );
  return Category;
};
