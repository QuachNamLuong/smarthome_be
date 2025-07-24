const orderService = require("../services/orderService");
const AppError = require("../utils/AppError");

const getOrderDetail = async (req, res) => {
  const {orderId} = req.params;

  try {
    const orderDetail = await orderService.getOrderDetail(orderId);
    return res.status(200).json(orderDetail);
  } catch(err) {
    if (err instanceof AppError) 
      return res.status(err.statusCode).json({message: err.message});
  }
};

const createOrder = async (req, res) => {
  const { userId, cartId, shippingPhone, shippingAddress } = req.body;
  try {
    const newOrder = await orderService.createOrder(userId, cartId, shippingPhone, shippingAddress);
    return res.status(201).json(newOrder);
  } catch (err) {
    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });
  }
};

const orderController = {
  createOrder,
  getOrderDetail
};

module.exports = orderController;
