const cartItemRepository = require("../repositories/cartItemRepository");
const cartServiceItemRepository = require("../repositories/cartServiceItemRepository");
const cartRepository = require("../repositories/cartRepository");
const orderItemRepository = require("../repositories/orderItemRepository");
const orderRepository = require("../repositories/orderRepository");
const packageServiceItemRepository = require("../repositories/packageServiceItemRepository");
const productVariantRepository = require("../repositories/productVariantRepository");
const AppError = require("../utils/AppError");
const db = require("../models");
const productVariantService = require("./productVariantService");
const orderServiceItemRepository = require("../repositories/orderServiceItemRepository");
const userRepository = require("../repositories/userService");
const orderHelper = require("../helper/orderHelper");

const createOrder = async (userId, cartId, shippingPhone, shippingAddress) => {
  let transaction;
  try {
    transaction = await db.sequelize.transaction();
    var { user, cart } = await orderHelper.validateUserAndCart(userId, cartId);
    const cartItems = await orderHelper.loadCartItemsWithServices(cartId);
    const orderTotal = await orderHelper.calculateOrderTotal(cartItems);
    const newOrder = await orderRepository.createOrder(
      {
        user_id: userId,
        order_total: orderTotal,
        shipping_phone: shippingPhone,
        shipping_address: shippingAddress,
      },
      transaction
    );
    await orderHelper.createOrderItemsAndServices(cartItems, newOrder, transaction);
    await orderHelper.cleanUpCart(cartItems, cartId, transaction);
    await transaction.commit();
    return newOrder;
  } catch (err) {
    console.error(err);
    if (transaction) await transaction.rollback();
    if (err instanceof AppError) throw err;
  }
};

const orderService = {
  createOrder,
};

module.exports = orderService;
