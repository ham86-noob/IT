class SubcategoriesController < ApplicationController
    def show
        @subcategories = Category.find(params[:id]).subcategories
    end
    def select
        @subcategories = Category.find(params[:id]).subcategories
        @article = Article.find_by(uuid: params[:article_uuid])
    end
end
