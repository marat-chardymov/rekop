class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(topic: params[:topic])
    byebug
    @message = Message.new
  end
end
