const apiConfig = {
  port: process.env.API_PORT,
  host: process.env.API_HOST,
  mode: process.env.API_MODE
};

let check = true;

if (!apiConfig.port) {
  check = false;
  console.error("API_PORT is missing in .env")
}

if (!apiConfig.host) {
  check = false;
  console.error("API_HOST is missing in .env")
}

if (!apiConfig.mode) {
  check = false;
  console.error("API_MODE is missing in .env")
}

if (!check) process.exit(1);

Object.freeze(apiConfig);

module.exports = apiConfig;