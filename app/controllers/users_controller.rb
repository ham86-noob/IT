class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users=User.all
    end

    def show
        @user=User.find_by(uuid: params[:uuid])

        #相互フォローならば
        @canCreateRoom = Relationship.exists?(follower_id: current_user.id, following_id: @user.id) && Relationship.exists?(follower_id: @user.id, following_id: current_user.id)

        currentUserEntry=Entry.where(user_id: current_user.id)
        userEntry=Entry.where(user_id: @user.id)

        #同室の部屋があるかどうかの確認
        unless @user.id == current_user.id
            currentUserEntry.each do |ce|
                userEntry.each do |e|
                    if ce.room_id == e.room_id then
                        @isRoom = true
                        @room = ce.room

                        # @room.uuid = SecureRandom.hex(8)
                        # @room.save
                    end
                end
            end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
    end

    def update
    end

    def followings
        # フォローしている人の一覧
        @user = User.find_by(uuid: params[:uuid])
        @users = @user.followings
    end

    def followers
        # フォローされている人の一覧    
        @user = User.find_by(uuid: params[:uuid])
        @users = @user.followers
    end

    def mypage
    end
end
