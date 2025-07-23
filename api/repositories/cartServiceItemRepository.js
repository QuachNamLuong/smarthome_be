const { CartServiceItem } = require("../models");

const findAllServiceItemsByCartItemId = (cartItemId) => {
  return CartServiceItem.findAll({ where: { cartitem_id: cartItemId } });
};

const deleteManyByCartItemId = (cartItemId, transaction) => {
  return CartServiceItem.destroy({
    where: { cartitem_id: cartItemId },
    transaction,
  });
};

const cartServiceItemRepository = {
  findAllServiceItemsByCartItemId,
  deleteManyByCartItemId,
};

module.exports = cartServiceItemRepository;
