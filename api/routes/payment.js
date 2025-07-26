const express = require("express");
const paymentController = require("../controllers/paymentController");

const paymentRouter = express.Router();

paymentRouter.get("/check-payment-vnpay", paymentController.checkPaymentVNPay);


module.exports = paymentRouter;