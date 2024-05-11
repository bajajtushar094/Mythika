const express = require("express");
const QuestionnaireController = require("../controllers/QuestionnaireController");

const router = express.Router();

router.post("", QuestionnaireController.addQuestion);


module.exports = router;