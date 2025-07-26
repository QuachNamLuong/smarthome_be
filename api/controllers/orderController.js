const orderService = require("../services/orderService");
const AppError = require("../utils/AppError");

const getOrderDetail = async (req, res) => {
  const { orderId } = req.params;

  try {
    const orderDetail = await orderService.getOrderDetail(orderId);
    return res.status(200).json(orderDetail);
  } catch (err) {
    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });
  }
};

const getUserOrders = async (req, res) => {
  const { userId } = req.params;
  try {
    const userOrders = await orderService.getUserOrders(userId);
    return res.status(200).json(userOrders);
  } catch (err) {
    return res.status(500).jsong({ message: "Server Error" });
  }
};

const createOrderVnPay = async (req, res) => {
  const { cartId, shippingPhone, shippingAddress, ipAddress } = req.body;
  try {
    const newOrder = await orderService.createOrderVnPay(
      cartId,
      ipAddress,
      shippingPhone,
      shippingAddress
    );
    return res.status(201).json(newOrder);
  } catch (err) {
    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });
  }
};

const createOrderCashOnDelivery = async (req, res) => {
  const { cartId, shippingPhone, shippingAddress } = req.body;
  try {
    const newOrder = await orderService.createOrderCashOnDelivery(
      cartId,
      shippingPhone,
      shippingAddress
    );
    return res.status(201).json(newOrder);
  } catch (err) {
    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });
  }
};

const updatePaidForOrderCashOnDelivery = async (req, res) => {
  const { orderId } = req.params;
  try {
    await orderService.updatePaidForOrderCashOnDelivery(orderId);
    return res.status(200).json({message: "update to paid successfull"});
  } catch (err) {
    console.error(err);

    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });

    return res.status(500).json({ message: "unhandle error" });
  }
};

const updateUnpaidForOrderCashOnDelivery = async (req, res) => {
  const { orderId } = req.params;
  try {
    await orderService.updateUnpaidForOrderCashOnDelivery(orderId);
    return res.status(200).json({message: "update to unpaid successfull"});
  } catch (err) {
    console.error(err);

    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });

    return res.status(500).json({ message: "unhandle error" });
  }
};

const orderController = {
  createOrderVnPay,
  getOrderDetail,
  getUserOrders,
  createOrderCashOnDelivery,
  updatePaidForOrderCashOnDelivery,
  updateUnpaidForOrderCashOnDelivery
};

module.exports = orderController;
