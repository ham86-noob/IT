class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        room = Room.find_by(uuid: params[:message][:room_uuid]) 
        if current_user.entries.where(room_id: room.id).present?
            @message = Message.create(params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: room.id))
            entries = Entry.where(room_id: room.id)

            entries.each do |e|
                if e.user.id != current_user.id
                    Notification.create(recipient_id: e.user.id, actor_id: current_user.id, notifiable: @message, action: "メッセージ送信")
                    e.user.update(notifications_count: e.user.notifications_count + 1)
                end
            end
        else
            flash[:alert] = "メッセージ送信に失敗しました。"
        end
        redirect_to room_path(@message.room)
    end
  end
  