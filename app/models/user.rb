# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Denylist

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  attr_reader :token

  has_many :chatrooms, foreign_key: :owner_id, dependent: :destroy, inverse_of: :owner
  has_one :participant, dependent: :destroy
  has_one :chatroom, through: :participant

  def on_jwt_dispatch(token, _payload)
    @token = "Bearer #{token}"
  end

  def belong_to?(chatroom)
    Boolean(chatroom.participants.where(user_id: id))
  end
end
