const { ProductVariant } = require("../models");
const { Transaction } = require("sequelize");
const AppError = require("../utils/AppError");

const findById = (variantId) => {
  return ProductVariant.findByPk(variantId);
};

const findByIdWithTransaction = (variantId, transaction) => {
  return ProductVariant.findOne({
    where: { variant_id: variantId },
    transaction,
    lock: Transaction.LOCK.UPDATE,
  });
};

const updateStock = (variant, newQuantity, transaction) => {
  variant.stock_quantity = newQuantity;
  return variant.save({transaction});
};

const getProductVariantPrice = async (productVariantId) => {
  const productVariant = await ProductVariant.findByPk(productVariantId);
  if (!productVariant) throw new AppError("product variant not found", 404);
  return productVariant.price;
};

const productVariantRepository = {
  findById,
  findByIdWithTransaction,
  updateStock,
  getProductVariantPrice
};

module.exports = productVariantRepository;
