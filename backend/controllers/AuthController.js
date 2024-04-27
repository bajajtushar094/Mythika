require("dotenv").config();
const bcrypt = require("bcrypt");
const {User} = require("../model/UserModel");
const jwt = require("jsonwebtoken");
