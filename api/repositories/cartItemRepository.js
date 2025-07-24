const { CartItem, CartServiceItem } = require("../models");

const findById = (cartItemId) => {
  return CartItem.findByPk(cartItemId);
};

const findAllByCartId = (cartId) => {
  return CartItem.findAll({
    where: { cart_id: cartId },
  });
};

const getCartItemsWithServicesByCartId = (cartId, transaction) =>
  CartItem.findAll({
    where: { cart_id: cartId },
    include: [{ model: CartServiceItem, as: "serviceItems" }],
    transaction,
    lock: transaction.LOCK.UPDATE
  });

const deleteAllByCartId = (cartId, transaction) => {
  return CartItem.destroy({ where: { cart_id: cartId }, transaction });
};

const cartItemRepository = {
  findById,
  findAllByCartId,
  deleteAllByCartId,
  getCartItemsWithServicesByCartId
};

module.exports = cartItemRepository;
