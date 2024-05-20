# frozen_string_literal: true

shared_examples 'success_response' do |data = nil|
  let(:json_response) { JSON.parse(response.body) }

  it { expect(response).to have_http_status(:success) }
  it { expect(json_response['message']).to eq('success') }
  it { expect(json_response['data']).to eq(data) unless data.nil? }
end
