const { BaseError } = require("sequelize");
const AppError = require("../utils/AppError");
const productVariantRepository = require("../repositories/productVariantRepository");
const db = require("../models");

const decreaseStockQuantity = async (variantId, quantityToReduce, passedTransaction) => {
  let transaction = passedTransaction;
  let createdTransaction = false;

  try {
    if (!transaction) {
      transaction = await db.sequelize.transaction();
      createdTransaction = true;
    }

    const variant = await productVariantRepository.findByIdWithTransaction(
      variantId,
      transaction
    );

    if (!variant) {
      throw new AppError("Product variant not found", 404);
    }

    if (variant.stock_quantity < quantityToReduce) {
      throw new AppError("Hết hàng", 400);
    }

    const newStockQuantity = variant.stock_quantity - quantityToReduce;
    
    variant.save({transaction});

    const updated = await productVariantRepository.updateStock(
      variant,
      newStockQuantity,
      transaction
    );

    if (createdTransaction) await transaction.commit();

    return updated;
  } catch (err) {
    if (createdTransaction && transaction) await transaction.rollback();

    if (err instanceof AppError) throw err;
    if (err instanceof BaseError) throw new AppError("Database error", 500);

    console.error("Unexpected error:", err);
    throw new AppError("Internal server error", 500);
  }
};

const productVariantService = {
  decreaseStockQuantity,
};

module.exports = productVariantService;
