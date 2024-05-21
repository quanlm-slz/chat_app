# frozen_string_literal: true

shared_examples 'error_response' do |status, error = nil|
  let(:json_response) do
    JSON.parse(response.body)
  rescue StandardError
    { message: 'wrong format' }
  end

  it { expect(response).to have_http_status(status) }
  it { expect(json_response['message']).to eq('error') }
  it { expect(Array(json_response['errors'])).to include(error) if error }
  it { expect(json_response['status']).to eq(status) }
end
