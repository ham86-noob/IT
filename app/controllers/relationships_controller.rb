class RelationshipsController < ApplicationController
    before_action :authenticate_user!

    def create
        unless Relationship.exists?(follower_id: params[:user_id], following_id: current_user.id)
            following = Relationship.create(follower_id: params[:user_id], following_id: current_user.id)
        end
        redirect_to request.referer
    end
  
    def destroy
      following = Relationship.find_by(follower_id: params[:user_id], following_id: current_user.id)
      following.destroy
      redirect_to request.referer
    end
end
