const orderStatus = require("../enums/orderStatus");
const {Order} = require("../models");

const createOrder = (orderData, transaction) => {
  return Order.create(orderData, { transaction });
};

const updateOrderStatus = (orderData, transaction) => {
  return Order.update(
    { order_status: orderData.newStatus },
    { where: { order_id: orderData.orderId } , transaction}
  );
};

const orderRepository = {
  createOrder,
  updateOrderStatus
}

module.exports = orderRepository;