class RecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id, :ingredient_id
    end
  end
end
