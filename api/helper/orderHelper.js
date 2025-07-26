const orderItemRepository = require("../repositories/orderItemRepository");
const productVariantService = require("../services/productVariantService");
const orderServiceItemRepository = require("../repositories/orderServiceItemRepository");

const calculateOrderTotal = (cartDetail) => {
  // let orderTotal = 0;
  // for (const cartItem of cartDetail.items) {
  //   let totalCartItemPrice = Number(cartItem.quantity) * Number(cartItem.product.price);
  //   for (const service of cartItem.services) {
  //     totalCartItemPrice += Number(service.price);
  //   }
  //   orderTotal += totalCartItemPrice;
  // }

  // return orderTotal;
  let total = 0;

  for (const item of cartDetail.items) {
    const productPrice = parseFloat(item.product.price); // Convert string to number
    const quantity = item.quantity;
    let itemTotal = productPrice * quantity;

    for (const service of item.services) {
      itemTotal += parseFloat(service.price);
    }

    total += itemTotal;
  }

  return total;
};

const createOrderItemsAndServicesFromCartDetail = async (
  cartDetail,
  orderId,
  transaction
) => {
  for (const cartItem of cartDetail.items) {
    const orderItem = await orderItemRepository.createOrderItem(
      {
        order_id: orderId,
        variant_id: cartItem.variant_id,
        quantity: cartItem.quantity,
        price_at_purchase: cartItem.product.price,
        total_item_price: Number(cartItem.price) * Number(cartItem.quantity),
      },
      transaction
    );

    await productVariantService.decreaseStockQuantity(
      orderItem.variant_id,
      orderItem.quantity,
      transaction
    );

    for (const serviceItem of cartItem.services) {
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

const orderHelper = {
  calculateOrderTotal,
  createOrderItemsAndServices: createOrderItemsAndServicesFromCartDetail,
};

module.exports = orderHelper;
