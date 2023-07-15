const ProductRoutes = require('express').Router();
const ProductController = require('./../controllers/product_controller');

ProductRoutes.get("/", ProductController.fetchAllProducts);
ProductRoutes.get("/category/:id", ProductController.fetchProductByCategory);
ProductRoutes.post("/", ProductController.createProduct);
ProductRoutes.delete("/", ProductController.deleteAllProducts); // New route for deleting all categories

module.exports = ProductRoutes;
