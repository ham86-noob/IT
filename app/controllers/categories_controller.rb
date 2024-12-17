class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    def select
        @categories = Category.all
        @article = Article.find_by(uuid: params[:uuid])
    end
end
