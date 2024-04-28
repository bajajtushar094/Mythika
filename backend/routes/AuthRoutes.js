const express = require("express");
const AuthController = require("../controllers/AuthController");
// const AuthMiddleware = require("../middlewares/AuthMiddleware");

const router = express.Router();

router.post("", AuthController.register);
router.post("/login", AuthController.login);
router.get("/welcome", (req, res) => {
    res.status(200).send("Welcome!");
});
// router.post("/additionalUserInfo", AuthMiddleware.verifyToken, AuthController.additionalUserInfo);




module.exports = router;