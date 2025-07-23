const vnpayConfig = {
  tmnCode: process.env.VNPAY_TMN_CODE,
  secret: process.env.VNPAY_SECRET,
  host: process.env.VNPAY_HOST,
  isTestMode: process.env.VNPAY_TEST_MODE,
};

let check = true;

if (!vnpayConfig.tmnCode) {
  check = false;
  console.error("VNPAY_TMN_CODE is missing in .env")
}

if (!vnpayConfig.secret) {
  check = false;
  console.error("VNPAY_SECRET is missing in .env")
}

if (!vnpayConfig.host) {
  check = false;
  console.error("VNPAY_HOST is missing in .env")
}

if (!vnpayConfig.isTestMode) {
  check = false;
  console.error("VNPAY_TEST_MODE is missing in .env")
}

if (!check) process.exit(1);

Object.freeze(vnpayConfig);

module.exports = vnpayConfig;
