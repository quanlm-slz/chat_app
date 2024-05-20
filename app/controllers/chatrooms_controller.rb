# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    data = Chatroom.fetch_page

    paginated_response(data)
  end

  def create
    data = Chatroom.create!(chatroom_params)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
