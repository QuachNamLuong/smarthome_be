const cartItemRepository = require("../repositories/cartItemRepository");
const cartServiceItemRepository = require("../repositories/cartServiceItemRepository");
const cartRepository = require("../repositories/cartRepository");
const orderItemRepository = require("../repositories/orderItemRepository");
const orderRepository = require("../repositories/orderRepository");
const packageServiceItemRepository = require("../repositories/packageServiceItemRepository");
const productVariantRepository = require("../repositories/productVariantRepository");
const AppError = require("../utils/AppError");
const db = require("../models");
const productVariantService = require("../services/productVariantService");
const orderServiceItemRepository = require("../repositories/orderServiceItemRepository");
const userRepository = require("../repositories/userRepository");
const { User, Cart, CartItem } = require("../models");
const { Transaction } = require("sequelize");

const validateUserAndCart = async (userId, cartId, transaction) => {
  const user = await userRepository.findById(userId);
  if (!user) throw new AppError("User not found", 404);

  const cart = await cartRepository.findById(cartId, transaction);

  if (!cart) throw new AppError(`Cart with id='${cartId}' not found`, 404);

  return { cart };
};

const calculateProductTotal = async (cartItems) => {
  let orderProductItemTotal = 0;
  for (const item of cartItems) {
    const price = await productVariantRepository.getProductVariantPrice(
      item.variant_id
    );
    item.price = price;
    orderProductItemTotal += price * item.quantity;
  }
  return orderProductItemTotal;
};

const calculateServiceTotal = async (cartItems) => {
  let orderServiceItemTotal = 0;
  for (const item of cartItems) {
    let itemServiceTotal = 0;
    for (const serviceItem of item.serviceItems) {
      const price =
        await packageServiceItemRepository.getPackageServiceItemPrice(
          serviceItem.package_service_item_id
        );
      serviceItem.price = price;
      itemServiceTotal += price;
    }
    orderServiceItemTotal += itemServiceTotal;
  }
  return orderServiceItemTotal;
};

const calculateOrderTotal = async (cartItems) => {
  const orderProductItemTotal = await calculateProductTotal(cartItems);

  const orderServiceItemTotal = await calculateServiceTotal(cartItems);

  const orderTotal = orderProductItemTotal + orderServiceItemTotal;
  return orderTotal;
};

const createOrderItemsAndServices = async (
  cartItems,
  newOrder,
  transaction
) => {
  for (const item of cartItems) {
    const orderItem = await orderItemRepository.createOrderItem(
      {
        order_id: newOrder.order_id,
        variant_id: item.variant_id,
        quantity: item.quantity,
        price_at_purchase: item.price,
        total_item_price: item.price * item.quantity,
      },
      transaction
    );

    await productVariantService.decreaseStockQuantity(
      item.variant_id,
      item.quantity,
      transaction
    );

    for (const serviceItem of item.serviceItems) {
      await orderServiceItemRepository.createOrderServiceItem(
        {
          order_item_id: orderItem.order_item_id,
          package_service_item_id: serviceItem.package_service_item_id,
          price: serviceItem.price,
        },
        transaction
      );
    }
  }
};

const cleanUpCart = async (cartItems, cartId, transaction) => {
  await Promise.all(
    cartItems.map((item) =>
      cartServiceItemRepository.deleteManyByCartItemId(item.cartitem_id)
    )
  );

  await cartItemRepository.deleteAllByCartId(cartId, transaction);
  await cartRepository.deleteCartById(cartId, transaction);
};

const orderHelper = {
  validateUserAndCart,
  calculateOrderTotal,
  createOrderItemsAndServices,
  cleanUpCart,
};

module.exports = orderHelper;
