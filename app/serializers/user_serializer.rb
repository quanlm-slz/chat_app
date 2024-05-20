# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  attribute :token, if: :token_exists?

  def token_exists?
    object.try(:token).present?
  end
end
