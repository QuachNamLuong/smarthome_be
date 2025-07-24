const { User } = require("../models");

/**
 * Finds a user by their primary key (user ID).
 *
 * @param {number} userId - The unique identifier of the user.
 * @returns {Promise<import("../models").User|null>} A promise that resolves to the User instance if found, or null if not found.
 */
const findById = (userId) => User.findByPk(userId);

const userRepository = {
  findById,
};

module.exports = userRepository;
