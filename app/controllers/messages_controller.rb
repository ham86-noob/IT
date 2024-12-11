class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        if current_user.entries.where(room_id: params[:message][:room_id]).present?
            @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
            reciever = Entry.where(room_id: params[:message][:room_id]).where.not(user_id: current_user.id).first.user
            Notification.create(recipient_id: reciever.id, actor_id: current_user.id, notifiable: @message.room, action: "メッセージ送信")
            reciever.update(notifications_count: reciever.notifications_count + 1)
        else
            flash[:alert] = "メッセージ送信に失敗しました。"
        end
        redirect_to room_path(@message.room_id)
    end
  end
  