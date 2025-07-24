const { Cart, CartItem } = require("../models");

/**
 * Finds a Cart by its primary key (cart ID), using a transaction and applying a row-level lock (`FOR UPDATE`).
 *
 * @param {number} cartId - The unique identifier of the cart.
 * @param {import("sequelize").Transaction} transaction - Sequelize transaction object used to ensure atomicity and apply locking.
 * @returns {Promise<import("../models").Cart|null>} A promise that resolves to the Cart instance if found, or null if not found.
 */
const findById = (cartId, transaction) =>
  Cart.findByPk(cartId, { transaction, lock: transaction.LOCK.UPDATE });

/**
 * Retrieves a cart by its ID along with its associated cart items,
 * using a transaction and applying a row-level lock (`FOR UPDATE`) on the cart.
 *
 * @param {number} cartId - The unique ID of the cart to retrieve.
 * @param {import("sequelize").Transaction} transaction - Sequelize transaction object used for atomic operations and locking.
 * @returns {Promise<import("../models").Cart|null>} A promise that resolves to the Cart object with included CartItems, or null if not found.
 */
const getCartWithItemsById = (cartId, transaction) =>
  Cart.findByPk({
    cartId,
    include: [{ model: CartItem, as: "cartItems" }],
    transaction,
    lock: transaction.LOCK.UPDATE,
  });

/**
 * Deletes a cart by its ID using a Sequelize transaction.
 *
 * @param {number} cartId - The unique identifier of the cart to delete.
 * @param {import("sequelize").Transaction} transaction - Sequelize transaction object to ensure atomicity.
 * @returns {Promise<number>} A promise that resolves to the number of rows deleted (0 if not found).
 */
const deleteCartById = (cartId, transaction) =>
  Cart.destroy({
    where: { cart_id: cartId },
    transaction,
  });

const cartRepository = {
  findById,
  deleteCartById,
  getCartWithItemsById,
};

module.exports = cartRepository;
