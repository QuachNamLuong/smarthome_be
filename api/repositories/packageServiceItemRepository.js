const { PackageServiceItem } = require("../models");

const getPackageServiceItemPrice = async (packageServiceItemId) => {
  const packageServiceItem = await PackageServiceItem.findByPk(packageServiceItemId);
  return packageServiceItem.item_price_impact;
};

const packageServiceItemRepository = {
  getPackageServiceItemPrice,
};

module.exports = packageServiceItemRepository;
