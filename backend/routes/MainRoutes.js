require("dotenv").config();
const express = require("express");
const authRouter = require("./AuthRoutes");
const symptomRouter = require("./SymptomRoutes");

const app = express();

app.use("/auth/", authRouter); 
app.use("/symptom/", symptomRouter); 

module.exports = app;