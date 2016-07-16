class ReviewsController < ApplicationController
   
   before_action :set_review, only: [:edit,:update]
   before_action :require_user, except: [:index, :show]
   
   $recipe = nil
   def new
        $recipe = Recipe.find(params[:recipe_id])
        if(current_user.reviews.find_by(recipe: $recipe)==nil)
            @review = Review.new
        else
            flash[:danger]="You can only review a recipe once!"
            redirect_to recipes_path
        end
    end
    
    def edit
        
    end

    def update
        if @review.update(review_params)
         flash[:success] = "Your review has been updated!!"
         redirect_to recipes_path
      else
         render :edit
      end
    end
    
   def create
     @review = Review.new(review_params)
     @review.chef = current_user
     @review.recipe = $recipe
      if @review.save
          flash[:success] = "Your Review has been posted successfully!"
          redirect_to recipes_path
      else
          render 'new'
      end
   end
   
   def index
     @reviews = Review.paginate(page: params[:page],per_page: 4)
     @recipe = Recipe.find(params[:recipe_id])
   end
   
   private
     def review_params
        params.require(:review).permit(:review,:recipe_id)
     end
     
     def set_review
        @review = Review.find(params[:id])
     end
end