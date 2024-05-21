# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    data = Chatroom.fetch_page
    paginated_response(data)
  end

  def create
    data = policy_scope(Chatroom).create!(chatroom_params)
    success_response(data)
  end

  def destroy
    current_chatroom.destroy!
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def current_chatroom
    @current_chatroom ||= policy_scope(Chatroom).find(id: params[:id])
  end
end
