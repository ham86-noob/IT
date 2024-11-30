class UsersController < ApplicationController
    def new
        # ユーザー新規作成フォームを表示
    end

    def create
        # params[:user] で送信されたデータを使ってユーザー情報を処理します
        if params[:password] != params[:password_confirmation]
            flash[:alert] = "入力に誤りがあります。"
            redirect_to "/users/new"
            #render :new #これは、下に:newを表示してくれるぽい
        elsif User.create(name: params[:name], email: params[:email], password: params[:password])
            flash[:notice] = "アカウントが作成されました。"
            redirect_to root_path 
        else
            flash[:alert] = "入力に誤りがあります。"
            redirect_to "/users/new"
        end
    end
end
