class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    
    def show
        @user=User.find(params[:id])
        @currentUserEntry=Entry.where(user_id: current_user.id)
        @userEntry=Entry.where(user_id: @user.id)
        unless @user.id == current_user.id
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                if cu.room_id == u.room_id then
                    @isRoom = true
                    @roomId = cu.room_id
                end
            end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
    end
      
    def follow
        @user = User.find(params[:user_id])
        current_user.follow(@user)
        redirect_to user_path(@user)
    end

    def unfollow
        @user = User.find(params[:user_id])
        current_user.stop_following(@user)
        redirect_to user_path(@user)
    end


    def follow_list
        @user = User.find(params[:user_id])
    end

    def follower_list
        @user = User.find(params[:user_id])
    end

end
