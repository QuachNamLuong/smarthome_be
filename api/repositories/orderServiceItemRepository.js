const { OrderServiceItem } = require("../models");

const getOrderServiceItemById = (orderServiceItemId, transaction) =>
  OrderServiceItem.findByPk(orderServiceItemId, {
    transaction,
    lock: transaction.LOCK.UPDATE,
  });

const getAllOrderItemServicesByOrderItemId = (orderItemId, transaction) =>
  OrderServiceItem.findAll({
    where: { order_item_id: orderItemId },
    transaction,
    lock: transaction.LOCK.UPDATE,
  });

const createOrderServiceItem = (orderServiceItemData, transaction) =>
  OrderServiceItem.create(orderServiceItemData, { transaction });

const deleteOrderServiceItemById = (orderServiceItemId, transaction) =>
  OrderServiceItem.destroy({
    where: { order_item_service_id: orderServiceItemId },
    transaction,
  });

const orderServiceItemRepository = {
  getOrderServiceItemById,
  getAllOrderItemServicesByOrderItemId,
  createOrderServiceItem,
  deleteOrderServiceItemById,
};

module.exports = orderServiceItemRepository;
