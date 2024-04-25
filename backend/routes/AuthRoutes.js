const express = require("express");
// const AuthController = require("../controllers/AuthController");
// const AuthMiddleware = require("../middlewares/AuthMiddleware");

const router = express.Router();

// router.post("/register", AuthController.register);
// router.post("/login", AuthController.login);
router.post("/welcome", (req, res) => {
    res.status(200).send("Welcome!");
});
// router.post("/additionalUserInfo", AuthMiddleware.verifyToken, AuthController.additionalUserInfo);




module.exports = router;