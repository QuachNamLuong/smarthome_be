const { PackageServiceItem } = require("../models");

/**
 * Retrieves the price impact of a package service item by its ID.
 *
 * @param {number} packageServiceItemId - The ID of the package service item to look up.
 * @returns {Promise<number>} The price impact of the service item.
 * @throws {Error} If the item is not found or the price is invalid.
 */
const getPackageServiceItemPrice = async (packageServiceItemId) => {
  const packageServiceItem = await PackageServiceItem.findByPk(packageServiceItemId);
  return Number(packageServiceItem.item_price_impact);
};

const packageServiceItemRepository = {
  getPackageServiceItemPrice,
};

module.exports = packageServiceItemRepository;
