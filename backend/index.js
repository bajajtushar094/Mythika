const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const passport = require("passport");
const session = require("express-session");
const methodOverride = require("method-override");
const helmet = require("helmet");
const dotenv = require("dotenv");
const mainRouter = require("./routes/MainRoutes");

const app = express();

dotenv.config();
// require("./config/database").connect();

mongoose
	.connect(process.env.MONGO_URI || "mongodb://localhost:27017/xPort")
	.then(() => {
		console.log("Database Connected");
	})
	.catch((err) => {
        console.log("Database not connected: "+err.message)
	});

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json({ limit: "50mb" }));
app.use(
	express.urlencoded({
		limit: "50mb",
		extended: true,
		parameterLimit: 50000,
	})
);

app.use(morgan("dev"));
app.use(methodOverride("_method"));
app.use(
	session({
		secret: "Fuck your mother",
		resave: false,
		saveUninitialized: false,
		cookie: {
			maxAge: 180 * 60 * 10000,
		},
	})
);

app.get("/", (req, res) => {
	res.status(200).send({
		success: true,
		message: "API Working",
	});
});

app.use("/", mainRouter);

app.listen(process.env.PORT || 8080, () => {
	console.log(
		`Server started on http://localhost${process.env.PORT || 8080}:`
	);
});