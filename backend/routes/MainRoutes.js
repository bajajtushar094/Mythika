require("dotenv").config();
const express = require("express");
const authRouter = require("./AuthRoutes");
const symptomRouter = require("./SymptomRoutes");
const questionnaireRouter = require("./QuestionnaireRoutes");

const app = express();

app.use("/auth/", authRouter); 
app.use("/symptom/", symptomRouter); 
app.use("/questionnaire/", questionnaireRouter);

module.exports = app;