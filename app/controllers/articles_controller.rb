class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:mockup]

    def search
        #params[:keyword]を使って検索
    end

    def mockup
        @featured_articles = Article.featured.limit(8)
        @categories = Category.all
    end

    def new
        if user_signed_in?
        else
            redirect_to new_user_session_path
        end
    end

    def create
        if user_signed_in?
            Article.create(article_params)
            #user: current_user, title: params[:title], content: params[:content], featured: true)
            redirect_to root_path   
        else
            #使うつもりはないエラー
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    private

    def article_params
        params.require(:article).permit(:title, :content, :image).merge(user_id: current_user.id, featured: true)
    end
end
