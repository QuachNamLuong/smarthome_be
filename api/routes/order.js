const express = require("express");
const orderController = require("../controllers/orderController");
const orderRepository = require("../repositories/orderRepository");
const orderService = require("../services/orderService");

const orderRouter = express.Router();

orderRouter.post("/", orderController.createOrder);
orderRouter.get("/detail/:orderId", orderController.getOrderDetail);
orderRouter.get("/user/:userId", orderController.getUserOrders);
orderRouter.get("/test", () => {
  orderService.markOrderAsPaidByVnPay(5);
})



module.exports = orderRouter;
