class ArticlesController < ApplicationController
    def login
        redirect_to new_user_session_path
    end
    def signup
        redirect_to new_user_registration_path
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
        unless user_signed_in?
            redirect_to new_user_session_path
        end
    end
    def create
        if user_signed_in?
            article = Article.new(user: current_user, title: params[:title], content: params[:content], featured: true)
            article.save
            redirect_to "/articles/mockup"
        else
            #使うつもりはないエラー
        end
    end
end
