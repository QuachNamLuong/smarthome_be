const cartItemRepository = require("../repositories/cartItemRepository");
const cartRepository = require("../repositories/cartRepository");
const orderRepository = require("../repositories/orderRepository");
const AppError = require("../utils/AppError");
const db = require("../models");
const orderHelper = require("../helper/orderHelper");
const userRepository = require("../repositories/userRepository");
const paymentService = require("./paymentService");
const cartService = require("./cartService");

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

const getOrderById = async (orderId) => {
  try {
    const order = await orderRepository.getOrderById(orderId);
    if (!order) throw new AppError("Order not found", 404);
    return order;
  } catch (err) {
    console.err(err);

    if (err instanceof AppError) throw err;

    throw new AppError("Can not get Order", 500);
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
    const cartDetail = await cartService.getCartDetail(cartId);
    const orderTotal = orderHelper.calculateOrderTotal(cartDetail);

    console.log(`orderTotal=${orderTotal}`);

    const newOrder = await orderRepository.createOrder(
      {
        user_id: cartDetail.user_id,
        order_total: orderTotal,
        shipping_phone: shippingPhone,
        shipping_address: shippingAddress,
      },
      transaction
    );
    await orderHelper.createOrderItemsAndServices(
      cartDetail,
      newOrder.order_id,
      transaction
    );

    await transaction.commit();
    return newOrder;
  } catch (err) {
    console.error(err);
    if (transaction) await transaction.rollback();
    if (err instanceof AppError) throw err;
  }
};

const createOrderVnPay = async (
  cartId,
  ipAddress,
  shippingPhone,
  shippingAddress
) => {
  try {
    const newOrder = await createOrder(cartId, shippingPhone, shippingAddress);
    console.log(newOrder);
    const vnpayUrl = await paymentService.createVnPayUrl(
      newOrder.order_id,
      ipAddress
    );
    return { newOrder, vnpayUrl };
  } catch (err) {
    console.error(err);
    if (transaction) await transaction.rollback();
    if (err instanceof AppError) throw err;
  }
};

const createOrderCashOnDelivery = async (
  cartId,
  shippingPhone,
  shippingAddress
) => {
  try {
    const newOrder = await createOrder(cartId, shippingPhone, shippingAddress);
    await markOrderAsByCashOnDelivery(newOrder.order_id);
    return orderRepository.getOrderById(newOrder.order_id);
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

const markOrderAsByCashOnDelivery = async (orderId) => {
  try {
    const order = await orderRepository.getOrderById(orderId);
    if (!order) throw new AppError("Order not found", 404);

    const updated = await orderRepository.updateOrder(orderId, {
      payment_method: "cash_on_delivery",
    });
    if (updated === 0)
      throw new AppError("order not update to cash_on_delivery", 500);
  } catch (err) {
    console.error(err);
    if (err instanceof AppError) throw err;
    throw new AppError("Can not apply cash_on_delivery", 500);
  }
};

const updatePaidForOrderCashOnDelivery = async (orderId) => {
  try {
    const order = await getOrderById(orderId);
    if (order.payment_method !== "cash_on_delivery")
      throw new AppError("This order is not cash on delivery", 400);

    if (order.order_status === "paid")
      throw new AppError("Order already paid", 400);

    const updated = await orderRepository.updateOrder(orderId, {
      order_status: "paid",
    });
    if (updated === 0) throw new AppError("Order not update", 500);
  } catch (err) {
    if (err instanceof AppError) throw err;
    throw new AppError("Can not update paid for order cash on delivery", 500);
  }
};

const updateUnpaidForOrderCashOnDelivery = async (orderId) => {
  try {
    const order = await getOrderById(orderId);
    if (order.payment_method !== "cash_on_delivery")
      throw new AppError("This order is not cash on delivery", 400);

    if (order.order_status === "unpaid")
      throw new AppError("Order already unpaid", 400);

    const updated = await orderRepository.updateOrder(orderId, {
      order_status: "unpaid",
    });
    if (updated === 0) throw new AppError("Order not update", 500);
  } catch (err) {
    if (err instanceof AppError) throw err;
    throw new AppError("Can not update paid for order cash on delivery", 500);
  }
};

const orderService = {
  createOrderVnPay,
  getOrderDetail,
  getUserOrders,
  markOrderAsPaidByVnPay,
  createOrderCashOnDelivery,
  getOrderById,
  updatePaidForOrderCashOnDelivery,
  updateUnpaidForOrderCashOnDelivery
};

module.exports = orderService;
