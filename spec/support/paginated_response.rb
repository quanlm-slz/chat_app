# frozen_string_literal: true

shared_examples 'paginated_response' do
  let(:json_response) { JSON.parse(response.body) }

  it { expect(response).to have_http_status(:success) }
  it { expect(json_response['status']).to eq(status) }
  it { expect(json_response['message']).to eq('success') }

  it do
    expect(json_response.dig('data', 'pagination').keys)
      .to include(
        'current_page',
        'total_pages',
        'total_items',
        'limit_per_page'
      )
  end

  it { expect(json_response.dig('data', 'items')).to be_a Array }
end
