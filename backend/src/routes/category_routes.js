const CategoryRoutes = require('express').Router();
const CategoryController = require('./../controllers/category_controller');

CategoryRoutes.get("/", CategoryController.fetchAllCategories);
CategoryRoutes.get("/:id", CategoryController.fetchCategoryById);
CategoryRoutes.post("/", CategoryController.createCategory);
CategoryRoutes.delete("/", CategoryController.deleteAllCategories); // New route for deleting all categories


module.exports = CategoryRoutes;
