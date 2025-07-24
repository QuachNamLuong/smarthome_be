const vnpay = require("../lib/vnpay");
const paymentService = require("../services/paymentService");
const orderService = require("../services/orderService");
const orderRepository = require("../repositories/orderRepository");

const createVNPayPaymentUrl = async (req, res) => {
  const { orderId, ipAddress } = req.body;

  try {
    const vnpayPaymentUrl = await paymentService.createVnPayUrl(
      orderId,
      ipAddress
    );

    const response = {
      vnpayPaymentUrl,
    };

    return res.status(201).json(response);
  } catch (err) {
    console.error(err);
    return res.status(400).json({ message: "create payment vnpay url fail" });
  }
};

const checkPaymentVNPay = async (req, res) => {
  const queryParams = req.query;

  console.log(queryParams);
  const isValidSignature = vnpay.verifyReturnUrl(queryParams);

  if (!isValidSignature) {
    return res.redirect(
      "https://your-frontend.com/payment-fail?error=invalid-signature"
    );
  }

  const { vnp_TxnRef, vnp_ResponseCode } = queryParams;
  const orderId = vnp_TxnRef;
  if (vnp_ResponseCode === "00") {
    console.log("✅ Payment success:", vnp_TxnRef);
    await orderService.markOrderAsPaidByVnPay(orderId);
    return res.redirect(
      `https://your-frontend.com/payment-success?orderId=${orderId}`
    );
  } else {
    console.warn("❌ Payment failed:", vnp_TxnRef);

    return res.redirect(
      `https://your-frontend.com/payment-fail?orderId=${orderId}`
    );
  }
};

const paymentController = { createVNPayPaymentUrl, checkPaymentVNPay };

module.exports = paymentController;
