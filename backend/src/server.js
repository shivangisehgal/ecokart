const express = require('express');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const morgan = require('morgan');
const cors = require('cors');
const mongoose = require('mongoose');

const app = express(); //requests are on this app
app.use(bodyParser.json()); //to parse jsons
app.use(bodyParser.urlencoded({ extended: false }));
app.use(helmet());
app.use(morgan('dev')); //type of login
app.use(cors());

mongoose.connect("mongodb+srv://shivangisehgal:shivangi1@cluster0.g8aztfq.mongodb.net/EcoCart?retryWrites=true&w=majority");

const UserRoutes = require('./routes/user_routes');
app.use("/api/user", UserRoutes);

const CategoryRoutes = require('./routes/category_routes');
app.use("/api/category", CategoryRoutes);


const ProductRoutes = require('./routes/product_routes');
app.use("/api/product", ProductRoutes);

const CartRoutes = require('./routes/cart_routes');
app.use("/api/cart", CartRoutes);

const OrderRoutes = require('./routes/order_routes');
app.use("/api/order", OrderRoutes);

//app.get("/", function(req, res){
//  res.json({message: "Hello world"});
//});


const PORT = 5020;
app.listen(PORT, () => console.log(`Server started at PORT: ${PORT}`));

