const vnpay = require("../lib/vnpay");
const apiConfig = require("../config/api.config");
const orderRepository = require("../repositories/orderRepository");
const AppError = require("../utils/AppError");
const { VnpLocale, dateFormat, ProductCode } = require("vnpay");

const createVnPayUrl = async (orderId, ipAddress) => {
  const createdAt = new Date();
  const expiresAt = new Date(createdAt.getTime() + 30 * 60 * 1000); // + 30 phút

  try {
    const order = await orderRepository.getOrderById(orderId);
    if (!order) throw new AppError("Order not found", 404);
    const vnpayPaymentUrl = vnpay.buildPaymentUrl({
      vnp_Amount: order.order_total,
      vnp_IpAddr: ipAddress,
      vnp_TxnRef: `${orderId}`,
      vnp_OrderInfo: `${orderId}`,
      vnp_OrderType: ProductCode.Other,
      vnp_ReturnUrl: `http://${apiConfig.host}:${apiConfig.port}/payment/check-payment-vnpay`,
      vnp_Locale: VnpLocale.VN,
      vnp_CreateDate: dateFormat(createdAt),
      vnp_ExpireDate: dateFormat(expiresAt),
    });

    return vnpayPaymentUrl
  } catch (err) {
    console.error(err);
    if (err instanceof AppError) throw err;
    throw new AppError("Can not create vnpay url", 500);
  }
};

const paymentService = {
  createVnPayUrl
};

module.exports = paymentService;