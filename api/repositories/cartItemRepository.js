const { CartItem } = require("../models");

const findById = (cartItemId) => {
  return CartItem.findByPk(cartItemId);
};

const findAllByCartId = (cartId) => {
  return CartItem.findAll({
    where: { cart_id: cartId },
  });
};

const deleteAllByCartId = (cartId, transaction) => {
  return CartItem.destroy({ where: { cart_id: cartId }, transaction });
};

const cartItemRepository = {
  findById,
  findAllByCartId,
  deleteAllByCartId
};

module.exports = cartItemRepository;
