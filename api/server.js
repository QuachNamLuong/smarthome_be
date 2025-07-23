require("dotenv").config();
const apiConfig = require("./config/api.config");
const app = require("./index");
const cartItemRepository = require("./repositories/cartItemRepository");

process.on("uncaughtException", (err) => {
  console.error("Uncaught Exception:", err);
  process.exit(1);
});

const server = app.listen(apiConfig.port, () => {
  console.log(`Server is running on port ${apiConfig.port}`);
});

process.on("unhandledRejection", (reason, promise) => {
  console.error("Unhandled Rejection:", reason);
  server.close(() => process.exit(1));
});