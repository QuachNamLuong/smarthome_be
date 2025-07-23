const express = require("express");
const paymentController = require("../controllers/paymentController");

const paymentRouter = express.Router();

paymentRouter.post('/create_payment_url', paymentController.createVNPayPaymentUrl);
paymentRouter.get("/check-payment-vnpay", paymentController.checkPaymentVNPay);

module.exports = paymentRouter;