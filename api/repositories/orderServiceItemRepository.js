const { OrderServiceItem } = require("../models");

const createOrderServiceItem = (orderServiceItemData, transaction) => {
  return OrderServiceItem.create(orderServiceItemData, { transaction });
};

const orderServiceItemRepository = {
  createOrderServiceItem,
};

module.exports = orderServiceItemRepository;
