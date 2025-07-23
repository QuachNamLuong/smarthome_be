const db = require("../models");
const { OrderItem } = db;

const createOrderItem = async (orderItemData, transaction) => {
  const newItem = await OrderItem.create(
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

  return newItem;
};

const orderItemRepository = {
  createOrderItem,
};

module.exports = orderItemRepository;
