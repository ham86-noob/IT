class SubcategoriesController < ApplicationController
    def show
        @subcategories = Category.find(params[:id]).subcategories
    end
end
