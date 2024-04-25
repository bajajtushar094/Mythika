require("dotenv").config();
const express = require("express");
const authRouter = require("./AuthRoutes");

const app = express();

app.use("/auth/", authRouter); 

module.exports = app;