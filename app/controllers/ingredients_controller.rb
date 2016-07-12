class IngredientsController < ApplicationController
   
   def new
     @ingredient  =Ingredient.new
   end
   
   def create
     @ingredient = Ingredient.new(ingredient_params)
     if @ingredient.save
         flash[:success]= "Ingredient was created successfully"
         redirect_to recipes_path
     else
         render 'new'
     end
   end
   
   private
     def ingredient_params
         params.require(:ingredient).permit(:name)
     end
 
  

end