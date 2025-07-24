const orderStatus = require("../enums/orderStatus");
const { Order, OrderItem, OrderServiceItem } = require("../models");

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

const updateOrderStatus = (orderData, transaction) =>
  Order.update(
    { order_status: orderData.newStatus },
    { where: { order_id: orderData.orderId }, transaction }
  );

const orderRepository = {
  createOrder,
  updateOrderStatus,
  getUserOrders,
  getOrderDetail
};

module.exports = orderRepository;
