class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      respond_to do |format|
        flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'}
      end
    end
  end

  def show
    @chatroom = Chatroom.find_by(topic: params[:topic])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.new
  end


  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
