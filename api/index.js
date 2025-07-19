require("dotenv").config();

const express = require("express");
const app = express();

const helloRouter = require("./routes/hello");
const authRouter = require("./routes/auth");
const brandRouter = require("./routes/brand");
const categoryRouter = require("./routes/category");
const optionRouter = require("./routes/option");
const serviceRouter = require("./routes/service");
const productRouter = require("./routes/product");
const paymentRouter = require("./routes/payment");

const cors = require("cors");
const morgan = require("morgan");

app.use(morgan("dev"));
app.use(express.json());
app.use(cors());

app.use("/", helloRouter);

app.use("/auth", authRouter);
app.use("/brand", brandRouter);
app.use("/category", categoryRouter);
app.use("/option", optionRouter);
app.use("/service-package", serviceRouter);
app.use("/product", productRouter);
app.use("/payment", paymentRouter);

module.exports = app;
