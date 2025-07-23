const db = require("../models");

const { Product } = db;

const createProduct = async (productData) => {
  try {
    const product = await Product.create({
      product_name: productData.productName,
      brand_id: productData.brandId
    });

    return product;
  } catch (err) {
    console.error(err);
    throw new Error("Can not create product");
  }
};

const updateProduct = async (productId, productData) => {
  try {
    const product = await Product.update({
      product_name: productData.productName,
      brand_id: productData.brandId
    }, {
      where: { product_id: productId },
    });

    return product;
  } catch (err) {
    console.error(err);
    throw new Error("Can not update product");
  }
};

const productRepository = {
  createProduct,
  updateProduct
}

module.exports = productRepository;
