class ArticlesController < ApplicationController
    def index
        @featured_articles = Article.featured.limit(4)
        @categories = Category.all
    end

    def login
        redirect_to new_user_devised_session_path
    end
    def signup
        redirect_to new_user_devised_registration_path
    end

    def modoru
        redirect_to "/articles/mockup"
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
        article = Article.new(user: User.first, title: params[:title], content: params[:content], featured: true)
        article.save
        redirect_to "/articles/mockup"
    end
end
