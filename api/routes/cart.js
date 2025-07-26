const express = require("express");
const cartController = require("../controllers/cartController");

const cartRouter = express.Router();

cartRouter.get("/detail/:cartId", cartController.getCartDetail);


module.exports = cartRouter;