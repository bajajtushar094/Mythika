const {Schema, model} = require("mongoose");

const User = Schema({
    mobile:{
        type:String,
        requred:true
    },
    pin:{
        type:String,
        required:true
    },
    token:{
        type:String
    },
    age:{
        type:String
    }
})