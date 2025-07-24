const cartItemRepository = require("../repositories/cartItemRepository");
const cartRepository = require("../repositories/cartRepository");
const orderRepository = require("../repositories/orderRepository");
const AppError = require("../utils/AppError");
const db = require("../models");
const orderHelper = require("../helper/orderHelper");
const userRepository = require("../repositories/userRepository");

const getUserOrders = async (userId) => {
  try {
    const user = await userRepository.findById(userId);
    if (!user) throw new AppError("User not found", 404);

    return await orderRepository.getUserOrders(userId);
  } catch (err) {
    console.error(err);

    if (err instanceof AppError) throw err;
    throw new AppError("Can not get user orders", 500);
  }
};

const getOrderDetail = async (orderId) => {
  try {
    const orderDetail = orderRepository.getOrderDetail(orderId);
    if (!orderDetail) throw new AppError("Order not found", 404);

    return orderDetail;
  } catch (err) {
    console.error(err);

    if (err instanceof AppError) throw err;
    throw new AppError("Can not get order detail", 500);
  }
};

const createOrder = async (cartId, shippingPhone, shippingAddress) => {
  let transaction;
  try {
    transaction = await db.sequelize.transaction();
    const cart = await cartRepository.findById(cartId, transaction);
    if (!cart) throw new AppError("Cart not found", 404);

    const cartItemsWithServices =
      await cartItemRepository.getCartItemsWithServicesByCartId(
        cartId,
        transaction
      );

    const orderTotal = await orderHelper.calculateOrderTotal(
      cartItemsWithServices
    );
    const newOrder = await orderRepository.createOrder(
      {
        user_id: cart.user_id,
        order_total: orderTotal,
        shipping_phone: shippingPhone,
        shipping_address: shippingAddress,
      },
      transaction
    );
    await orderHelper.createOrderItemsAndServices(
      cartItemsWithServices,
      newOrder,
      transaction
    );
    await cartRepository.deleteCartById(cartId, transaction);
    await transaction.commit();
    return newOrder;
  } catch (err) {
    console.error(err);
    if (transaction) await transaction.rollback();
    if (err instanceof AppError) throw err;
  }
};

const markOrderAsPaidByVnPay = async (orderId) => {
  try {
    const order = await orderRepository.getOrderById(orderId);
    if (!order) throw new AppError("Order not found", 404);

    await orderRepository.updateOrder(orderId, {
      payment_method: "vnpay",
      payment_status: "paid",
    });
  } catch (err) {
    console.error(err);
    if (err instanceof AppError) throw err;
    throw new AppError("Can not paid", 500);
  }
};

const orderService = {
  createOrder,
  getOrderDetail,
  getUserOrders,
  markOrderAsPaidByVnPay,
};

module.exports = orderService;
