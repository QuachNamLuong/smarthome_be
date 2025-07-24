const express = require("express");
const orderController = require("../controllers/orderController");

const orderRouter = express.Router();

orderRouter.post("/", orderController.createOrder);
orderRouter.get("/:orderId", orderController.getOrderDetail);

module.exports = orderRouter;
