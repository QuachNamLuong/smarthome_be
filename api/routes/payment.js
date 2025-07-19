const { VNPay, VnpLocale, dateFormat, ProductCode } = require("vnpay");
const express = require("express");
const router = express.Router();


router.post('/create_payment_url', (req, res) => {
    const vnpay = new VNPay({
        tmnCode: "0TSSC1QT",
        secureSecret: "OTYGF8UKW9QVWWTE0BTY82Z1P3LOUA47",
        vnpayHost: "https://sandbox.vnpayment.vn",
        testMode: true,
        hashAlgorithm: "SHA512",
    });

    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const vnpayResponse = vnpay.buildPaymentUrl(
        {
            vnp_Amount: 5000000,
            vnp_IpAddr: "127.0.0.1",
            vnp_TxnRef: "quachnamluong_test_3",
            vnp_OrderInfo: "quachnamluong_test_3",
            vnp_OrderType: ProductCode.Other,
            vnp_ReturnUrl: "http://localhost:8000/payment/check-payment-vnpay",
            vnp_Locale: VnpLocale.VN,
            vnp_CreateDate: dateFormat(new Date()),
            vnp_ExpireDate: dateFormat(tomorrow)
        }
    );

    return res.status(201).json(vnpayResponse);
});

router.get("/check-payment-vnpay", (req, res) => {
    console.log(req.query);
    res.redirect("http://localhost:8000")
});

module.exports = router;