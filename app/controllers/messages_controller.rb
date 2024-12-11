class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        if current_user.entries.where(room_id: params[:message][:room_id]).present?
            @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
            entries = Entry.where(room_id: params[:message][:room_id])

            entries.each do |e|
                if e.user.id != current_user.id
                    Notification.create(recipient_id: e.user.id, actor_id: current_user.id, notifiable: @message.room, action: "メッセージ送信")
                    e.user.update(notifications_count: e.user.notifications_count + 1)
                end
            end
        else
            flash[:alert] = "メッセージ送信に失敗しました。"
        end
        redirect_to room_path(@message.room_id)
    end
  end
  