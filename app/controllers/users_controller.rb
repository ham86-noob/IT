class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users=User.all
    end

    def show
        @user=User.find(params[:id])

        #相互フォローならば
        @canCreateRoom = Relationship.exists?(follower_id: current_user.id, following_id: @user.id) && Relationship.exists?(follower_id: @user.id, following_id: current_user.id)

        currentUserEntry=Entry.where(user_id: current_user.id)
        userEntry=Entry.where(user_id: @user.id)

        #同室の部屋があるかどうかの確認
        unless @user.id == current_user.id
            currentUserEntry.each do |cu|
                userEntry.each do |u|
                    if cu.room_id == u.room_id then
                        @isRoom = true
                        @roomId = cu.room_id
                    end
                end
            end
            if @isRoom
                @room = Room.new
                @entry = Entry.new
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
    end

    def followings
        # フォローしている人の一覧
        @user = User.find(params[:id])
        @users = @user.followings
    end

    def followers
        # フォローされている人の一覧    
        @user = User.find(params[:id])
        @users = @user.followers
    end
end
