const cartService = require("../services/cartService");
const AppError = require("../utils/AppError");

const getCartDetail = async (req, res) => {
  const { cartId } = req.params;
  try {
    const cartDetail = await cartService.getCartDetail(cartId);
    return res.status(200).json({ cartDetail });
  } catch {
    console.error(err);

    if (err instanceof AppError)
      return res.status(err.statusCode).json({ message: err.message });

    return res.status(500).json({ message: "Unhandle Error" });
  }
};

const cartController = {
  getCartDetail,
};

module.exports = cartController;
