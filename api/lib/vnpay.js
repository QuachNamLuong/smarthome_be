const { VNPay } = require("vnpay");
const vnpayConfig = require("../config/vnpay.config");

const vnpay = new VNPay({
  tmnCode: vnpayConfig.tmnCode,
  secureSecret: vnpayConfig.secret,
  testMode: vnpayConfig.isTestMode === true,
  vnpayHost: vnpayConfig.host,
});

module.exports = vnpay;
