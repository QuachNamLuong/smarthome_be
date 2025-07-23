const { Cart } = require("../models");

const findById = (cartId) => {
  return Cart.findByPk(cartId);
};

const deleteCartById = (cartId, transaction) => {
  return Cart.destroy({
    where: { cart_id: cartId },
    transaction
  });
};

const cartRepository = {
  findById,
  deleteCartById
}

module.exports = cartRepository;
