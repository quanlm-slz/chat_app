# frozen_string_literal: true

require 'devise/jwt/test_helpers'

shared_context 'when user signed in' do
  let(:headers) do
    Devise::JWT::TestHelpers.auth_headers(
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      },
      user
    )
  end
end
