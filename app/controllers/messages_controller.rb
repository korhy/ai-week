class MessagesController < ApplicationController
  before_action :set_chat

  def create
    @message = @chat.messages.build(content: message_params[:content], role: "user")
    if @message.save
      # TODO: call AI API and save assistant response
      redirect_to @chat
    else
      @message = Message.new
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def set_chat
    @chat = current_user.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
