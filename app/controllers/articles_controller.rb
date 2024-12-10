class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def mockup
        @featured_articles = Article.featured(6)

        if user_signed_in?
            @followings_articles = []
            current_user.followings.each do |fu|
                @followings_articles.push(Article.where(user_id: fu.id))
            end
            @followings_articles.flatten!
            @followings_articles = @followings_articles.sort_by{|article| -article[:id]}
            @followings_articles = @followings_articles.first(6)
        end 
        @categories = Category.all
    end

    def new
    end

    def create
        Article.create(articles_params)
        #user: current_user, title: params[:title], content: params[:content], featured: true)
        redirect_to root_path 
    end

    def show
        @article = Article.find(params[:id])
    end

    def toggle_like
        if user_signed_in?
            if Like.where(user_id: current_user.id, article_id: params[:id]).present?
                like = Like.find_by(user_id: current_user.id, article_id: params[:id])
                like.destroy
            else
                Like.create(user_id: current_user.id, article_id: params[:id])
            end
            redirect_back(fallback_location: root_path)
        else
            redirect_to new_user_session_path
        end
    end

    private

    def articles_params
        params.require(:articles).permit(:title, :content, :image).merge(user_id: current_user.id, featured: true)
    end
end
