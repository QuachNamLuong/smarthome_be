const express = require("express");
const orderController = require("../controllers/orderController");

const orderRouter = express.Router();

orderRouter.post("/", orderController.createOrder);

module.exports = orderRouter;
