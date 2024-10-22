package query

func CreateRecipeForUser() string {
	return "INSERT INTO recipes (recipe_name, user_id) VALUES ($1, $2) RETURNING recipe_id;"
}

func GetRecipesForUser() string {
	return "SELECT recipe_id, recipe_name, user_id FROM recipes WHERE user_id = $1 ORDER BY recipe_name"
}

func UpdateRecipeForUser() string {
	return "UPDATE recipes SET recipe_name = $1 WHERE (recipe_id = $2) AND (user_id = $3)"
}

func DeleteRecipeForUser() string {
	return "DELETE FROM recipes WHERE (recipe_id = $1) AND (user_id = $2)"
}

// -------------------------------------------------------------------------------------------------

func AddIngredientToRecipe() string {
	return "INSERT INTO recipe_ingredients (recipe_id, drink_id, quantity_ml) VALUES ($1, $2, $3) RETURNING recipe_id;"
}

func UpdateIngredientInRecipe() string {
	return "UPDATE recipe_ingredients SET drink_id = $1, quantity_ml = $2 WHERE (recipe_id = $3) AND (ingredient_id = $4)"
}

func DeleteIngredientFromRecipe() string {
	return "DELETE FROM recipe_ingredients WHERE (recipe_id = $1) AND (drink_id = $2)"
}