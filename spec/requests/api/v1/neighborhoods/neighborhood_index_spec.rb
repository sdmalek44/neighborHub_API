require 'rails_helper'

describe 'GET /api/v1/neighborhoods' do
  it 'can get a list of all neighborhoods' do
    create_list(:district, 4)

    get '/api/v1/neighborhoods'

    expect(response).to be_successful

    neighborhoods = JSON.parse(response.body)

    expect(neighborhoods.count).to eq(4)
    expect(neighborhoods[0]['id']).to eq(1)
    expect(neighborhoods[0]['name']).to be_a(String)
  end
end
