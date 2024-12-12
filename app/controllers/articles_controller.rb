class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :update, :create, :destroy]

    def index
        @featured_articles = Article.includes(:user).where(featured: true).order(id: :desc).limit(4)
        
        @followings_articles = []

        if user_signed_in?
            # フォローしているユーザーのIDを取得
            following_ids = current_user.followings.pluck(:id)

            # フォローしているユーザーの記事を取得し、関連情報をプリロード
            @followings_articles = Article.where(user_id: following_ids).order(id: :desc).limit(4)
        end 
    end

    def new
    end

    def update
        article = Article.find(params[:id])
        if current_user.id == article.user_id
            article.update(update_articles_params)
        end
        redirect_to root_path
    end

    def create
        article = Article.create(create_articles_params)
        if article.valid?
            redirect_to select_categories_path(id: article.id)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        article = Article.find(params[:id])
        article.destroy
        redirect_to root_path
    end

    def show
        @article = Article.includes(image_attachment: :blob).find(params[:id])
    end

    def toggle_like
        if user_signed_in?
            like = Article.find(params[:id]).likes.find_by(user_id: current_user.id)
            if like
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

    def create_articles_params
        params.require(:article).permit(:title, :content, :image, :linkurl).merge(user_id: current_user.id, featured: true, subcategory_id: 1)
    end

    def update_articles_params
        params.require(:article).permit(:title, :content, :image, :linkurl, :subcategory_id)
    end
end
