const cartRepository = require("../repositories/cartRepository");
const AppError = require("../utils/AppError");

const getCartDetail = async (cartId) => {
  try {
    const cartDetail = await cartRepository.getCartDetailByCartId(cartId);
    if (!cartDetail) throw new AppError("Cart not found", 404);
    return cartDetail;
  } catch (err) {
    if (err instanceof AppError) throw err;

    throw new AppError("Can not get Cart detail", 500);
  }
};

const cartService = {
  getCartDetail
};

module.exports = cartService;


