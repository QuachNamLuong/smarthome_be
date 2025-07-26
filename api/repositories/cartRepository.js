const { Cart, CartItem, CartItemService, ProductVariant } = require("../models");

const findById = (cartId, transaction) =>
  Cart.findByPk(cartId, { transaction, lock: transaction.LOCK.UPDATE });

const getCartWithItemsById = (cartId, transaction) =>
  Cart.findByPk({
    cartId,
    include: [{ model: CartItem, as: "cartItems" }],
    transaction,
    lock: transaction.LOCK.UPDATE,
  });

const deleteCartById = (cartId, transaction) =>
  Cart.destroy({
    where: { cart_id: cartId },
    transaction,
  });

const getCartDetailByCartId = (cartId, transaction) => {
  const options = {
    include: [
      {
        model: CartItem,
        as: "items",
        include: [{ model: CartItemService, as: "services" }, {model: ProductVariant, as: "product"}],
      },
    ],
  };

  if (transaction) {
    options.transaction = transaction;
    options.lock = transaction.LOCK.UPDATE;
  }

  return Cart.findByPk(cartId, options);
};

const cartRepository = {
  findById,
  deleteCartById,
  getCartWithItemsById,
  getCartDetailByCartId,
};

module.exports = cartRepository;
