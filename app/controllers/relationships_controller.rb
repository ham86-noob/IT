class RelationshipsController < ApplicationController
    before_action :authenticate_user!

    def create
        following = Relationship.new(follower_id: params[:user_id], following_id: current_user.id)
        if following.id.present?
            following.save
        end
        redirect_back(fallback_location: root_path)
    end
  
    def destroy
      following = Relationship.find_by(follower_id: params[:user_id], following_id: current_user.id)
      if following.id.present?
        following.destroy
      end
      redirect_back(fallback_location: root_path)
    end
end
