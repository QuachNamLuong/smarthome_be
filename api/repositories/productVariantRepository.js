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
  if (newQuantity < 0) throw new AppError("quantity can not be negatice", 400);

  variant.stock_quantity = newQuantity;

  if (newQuantity === 0) variant.item_status = "out_of_stock";
  
  return variant.save({ transaction });
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
  getProductVariantPrice,
};

module.exports = productVariantRepository;
