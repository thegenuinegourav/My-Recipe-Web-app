class RecipeStyle < ActiveRecord::Base
   belongs_to :recipe
   belongs_to :style 
end