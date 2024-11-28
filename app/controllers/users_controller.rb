class UsersController < ApplicationController
    def new
        # ユーザー新規作成フォームを表示
      end
    
      def create
        # params[:user] で送信されたデータを使ってユーザー情報を処理します
        if params[:password] != params[:password_confirmation]?
            flash[:alert] = "入力に誤りがあります。"
            render :new
        else
            user = User.new(name: params[:name], email: params[:email], password: params[:password])
            user.save
            flash[:notice] = "アカウントが作成されました。"
            redirect_to root_path 
        end
      end
end
