const express = require("express");
const router = express.Router();
const optionController = require("../controllers/optionController");

router.get("/filter", optionController.filterOptions);
router.get("/:id", optionController.getOptionById);
router.post("/", optionController.createOption);
router.post("/:id", optionController.updateOption);
router.post("/:id", optionController.deleteOption);

module.exports = router;
