# frozen_string_literal: true

class Chatrooms::ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_current_chatroom, only: :index

  def index
    paginated_response(current_chatroom.participants.fetch_page)
  end

  def create
    request_chatroom = Chatroom.find_by!({
                                           invite_code:,
                                           id: params[:chatroom_id]
                                         })
    participant = request_chatroom.participants.create!(user: current_user)
    success_response(participant)
  end

  def destroy
    raise Pundit::NotAuthorizedError if current_participant.user_id != current_user.id && current_user.id != current_chatroom.owner_id

    current_participant.destroy!

    no_content_response
  end

  private

  def current_chatroom
    @current_chatroom ||= Chatroom.find(params[:chatroom_id])
  end

  def current_participant
    @current_participant ||= current_chatroom.participants.find(params[:id])
  end

  def invite_code
    params.require(:invite_code)
  end

  def authorize_current_chatroom
    authorize current_chatroom, policy_class: Chatroom::ParticipantPolicy
  end
end
