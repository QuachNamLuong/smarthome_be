const orderStatus = require("../enums/orderStatus");
const { Order, OrderItem, OrderServiceItem } = require("../models");

const getOrderById = (orderId) => Order.findByPk(orderId);

const getUserOrders = (userId) => Order.findAll({ where: { user_id: userId } });

const getOrderDetail = (orderId) =>
  Order.findByPk(orderId, {
    include: [
      {
        model: OrderItem,
        as: "orderItems",
        include: [{ model: OrderServiceItem, as: "serviceItems" }],
      },
    ],
  });

const createOrder = (orderData, transaction) =>
  Order.create(orderData, { transaction });

const updateOrder = (orderId, orderData, transaction) =>
  Order.update(orderData, { where: { order_id: orderId }, transaction });

const updateOrderStatus = (orderData, transaction) =>
  Order.update(
    { order_status: orderData.newStatus },
    { where: { order_id: orderData.orderId }, transaction }
  );

const orderRepository = {
  updateOrder,
  getOrderById,
  createOrder,
  updateOrderStatus,
  getUserOrders,
  getOrderDetail,
};

module.exports = orderRepository;
