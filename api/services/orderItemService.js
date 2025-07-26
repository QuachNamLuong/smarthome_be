const { OrderItem } = require("../models");
const orderItemRepository = require("../repositories/orderItemRepository");
const AppError = require("../utils/AppError");

const getOrderItemById = (orderItemId) => {
  try {
    const orderItem = orderItemRepository.getOrderItemById(orderItemId);
    if (!orderItem) throw new AppError("order item not found", 404);
    return orderItem;
  } catch (err) {
    console.error(err);

    if (err instanceof AppError) throw err;

    throw new AppError("Can not get order item by id", 500);
  }
};

const calculateOrderItemPrice = async (orderItemId) => {
  try {
    const orderItem = await orderItemRepository.getOrderItemWithServices(orderItemId);

    let orderItemPrice = orderItem.quantity * orderItem.price_at_purchase;
    for (service in orderItem.serviceItems) {
      orderItemPrice += service.price;
    }
    return orderItemPrice;
  } catch (err) {
    console.error(err);

    if (err instanceof AppError) throw err;

    throw new AppError("Can not calculate order item price", 500);
  }
};

const orderItemService = {
  getOrderItemById,
  calculateOrderItemPrice,
};

module.exports = orderItemService;
