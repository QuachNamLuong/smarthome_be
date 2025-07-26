const db = require("../models");
const orderServiceItemRepository = require("../repositories/orderServiceItemRepository");
const AppError = require("../utils/AppError");

const getOrderServiceItemById = async (orderServiceItemId) => {
  try {
    const orderServiceItem =
      await orderServiceItemRepository.getOrderServiceItemById(
        orderServiceItemId
      );

    if (!orderServiceItem)
      throw new AppError("order Service item not found", 404);

    return orderServiceItem;
  } catch (err) {
    console.error(err);

    if (err instanceof AppError) throw err;

    throw new AppError("Can not get order service item", 500);
  }
};

const checkOrderServiceItemExistsById = getOrderServiceItemById;

const deleteOrderServiceItemById = async (orderServiceItemId) => {
  try {
    await checkOrderServiceItemExistsById(orderServiceItemId);

    await orderServiceItemRepository.deleteOrderServiceItemById(
      orderServiceItemId
    );
  } catch (err) {
    console.error(err);

    if (err instanceof AppError) throw err;

    throw new AppError("Can not delete order service item", 500);
  }
};

const orderServiceItemService = {
  getOrderServiceItemById,
  deleteOrderServiceItemById,
};

module.exports = orderServiceItemService;
