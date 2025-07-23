const { User } = require("../models");

const findById = (userId) => {
  return User.findByPk(userId);
};

const userRepository = {
  findById,
};

module.exports = userRepository;
