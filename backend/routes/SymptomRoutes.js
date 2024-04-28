const express = require("express");
const SymptomController = require("../controllers/SymptomController");

const router = express.Router();

router.post("", SymptomController.addSymptom);
router.get("", SymptomController.getSymptoms);

module.exports = router;