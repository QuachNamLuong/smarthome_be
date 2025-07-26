const { OrderItem, OrderItemService } = require("../models");

const getOrderItemById = (orderItemId, transaction) =>
  OrderItem.findByPk(orderItemId, {
    transaction,
    lock: transaction.LOCK.UPDATE,
  });

const getOrderItemWithServices = (orderItemId, transaction) =>
  OrderItem.findByPk(orderItemId, {
    include: [{ model: OrderItemService, as: "serviceItems" }],
    transaction,
    lock: transaction.LOCK.UPDATE,
  });

const createOrderItem = (orderItemData, transaction) =>
  OrderItem.create(
    {
      order_id: orderItemData.order_id,
      variant_id: orderItemData.variant_id,
      quantity: orderItemData.quantity,
      price_at_purchase: orderItemData.price_at_purchase,
      total_item_price: orderItemData.total_item_price,
      item_status: orderItemData.item_status || "pending",
    },
    { transaction }
  );

const deleteOrderItemById = async (orderItemId, transaction) =>
  OrderItem.destroy({ where: { orderitem_id: orderItemId }, transaction });

const orderItemRepository = {
  getOrderItemById,
  createOrderItem,
  deleteOrderItemById,
  getOrderItemWithServices
};

module.exports = orderItemRepository;
