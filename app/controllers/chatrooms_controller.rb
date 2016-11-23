class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(topic: params[:topic])
    @message = Message.new
  end
end
