class PagesController < ApplicationController
    def home
        redirect_to recipes_path if logged_in?
    end
end