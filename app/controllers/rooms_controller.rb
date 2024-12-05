class RoomsController < ApplicationController
    before_action :authenticate_user!

    def create
        room = Room.new(user_id1: params[:entry][:user_id], user_id2: current_user.id)
        if room.valid?
            ActiveRecord::Base.transaction do
                room.save!
                Entry.create!(room_id: room.id, user_id: current_user.id)
                Entry.create!(params.require(:entry).permit(:user_id, :room_id).merge(room_id: room.id))
            end
            redirect_to room_path(room.id)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def show
        @room = Room.find(params[:id])
        if Entry.where(user_id: current_user.id,room_id: @room.id).present?
            @messages = @room.messages
            @message = Message.new
            @entries = @room.entries
        else
            redirect_back(fallback_location: root_path)
        end
    end
end
