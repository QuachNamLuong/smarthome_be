const { VnpLocale, dateFormat } = require("vnpay");
const apiConfig = require("../config/api.config");
const vnpay = require("../lib/vnpay");

const createVNPayPaymentUrl = (req, res) => {
  const { cartId, totalAmount, ipAddress } = req.body;

  const createdAt = new Date();
  const expiresAt = new Date(createdAt.getTime() + 30 * 60 * 1000); // + 30 phút

  try {
    const vnpayPaymentUrl = vnpay.buildPaymentUrl({
      vnp_Amount: totalAmount,
      vnp_IpAddr: ipAddress,
      vnp_TxnRef: cartId,
      vnp_OrderInfo: `${cartId}`,
      vnp_ReturnUrl: `http://${apiConfig.host}:${apiConfig.port}/api/check-payment-vnpay`,
      vnp_Locale: VnpLocale.VN,
      vnp_CreateDate: dateFormat(createdAt),
      vnp_ExpireDate: dateFormat(expiresAt),
    });

    const response = {
      paymentUrl: vnpayPaymentUrl,
    };

    return res.status(201).json(response);
  } catch (err) {
    console.error(err);
    return res.status(400).json({ message: "create payment vnpay url fail" });
  }
};

const checkPaymentVNPay = (req, res) => {
  const queryParams = req.query;

  console.log(queryParams);
  const isValidSignature = vnpay.verifyReturnUrl(queryParams);

  if (!isValidSignature) {
    return res.redirect(
      "https://your-frontend.com/payment-fail?error=invalid-signature"
    );
  }

  const {
    vnp_ResponseCode,
    vnp_TxnRef,
    vnp_TransactionNo,
    vnp_Amount,
    vnp_PayDate,
  } = queryParams;

  if (vnp_ResponseCode === "00") {
    console.log("✅ Payment success:", vnp_TxnRef);

    return res.redirect(
      `https://your-frontend.com/payment-success?cartId=${vnp_TxnRef}&amount=${vnp_Amount}&payDate=${vnp_PayDate}`
    );
  } else {
    console.warn("❌ Payment failed:", vnp_TxnRef);

    return res.redirect(
      `https://your-frontend.com/payment-fail?cartId=${vnp_TxnRef}&code=${vnp_ResponseCode}`
    );
  }
};

const paymentController = { createVNPayPaymentUrl, checkPaymentVNPay };

module.exports = paymentController;
