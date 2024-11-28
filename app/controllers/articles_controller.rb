class ArticlesController < ApplicationController
    def index
        @featured_articles = Article.featured.limit(4)
        @categories = Category.all
    end
    def login
    end
    def signup
    end
    def search
        #params[:keyword]を使って検索
    end
    def mockup
        @featured_articles = Article.featured.limit(4)
        @categories = Category.all
    end
    def write
    end
    def create
        Article.create(text: params[:text], content: params[:content], user: User.first, featured: true)
        redirect_to("/articles/mockup")
    end
end
