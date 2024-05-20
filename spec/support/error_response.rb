# frozen_string_literal: true

shared_examples 'error_response' do |status, error = nil|
  let(:json_response) { JSON.parse(response.body) }

  it { expect(response).to have_http_status(status) }
  it { expect(json_response['message']).to eq('error') }
  it { expect(json_response['errors']).to include(error) if error }
  it { expect(json_response['status']).to eq(status) }
end
