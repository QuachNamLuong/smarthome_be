const orderService = require("../services/orderService");
const AppError = require("../utils/AppError");

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
};

module.exports = orderController;
