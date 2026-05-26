class ChatsController < ApplicationController
  before_action :set_challenge, only: [:create]
  before_action :set_chat, only: [:show, :destroy]

  def show
    @message = Message.new
  end

  def create
    @chat = current_user.chats.build(title: @challenge.name, challenge: @challenge)
    if @chat.save
      redirect_to @chat
    else
      redirect_to @challenge, alert: "Could not start chat."
    end
  end

  def destroy
    @chat.destroy
    redirect_to @chat.challenge, notice: "Chat deleted."
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def set_chat
    @chat = current_user.chats.find(params[:id])
  end
end
