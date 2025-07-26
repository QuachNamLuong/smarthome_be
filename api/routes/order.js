const express = require("express");
const orderController = require("../controllers/orderController");

const orderRouter = express.Router();

orderRouter.post("/vnpay", orderController.createOrderVnPay);
orderRouter.post("/cash-on-delivery", orderController.createOrderCashOnDelivery);
orderRouter.get("/detail/:orderId", orderController.getOrderDetail);
orderRouter.get("/user/:userId", orderController.getUserOrders);
orderRouter.put("/update-paid/:orderId", orderController.updatePaidForOrderCashOnDelivery);
orderRouter.put("/update-unpaid/:orderId", orderController.updateUnpaidForOrderCashOnDelivery);

module.exports = orderRouter;
