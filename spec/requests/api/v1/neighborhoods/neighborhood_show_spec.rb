require 'rails_helper'

describe 'GET /api/v1/neighborhoods/:id' do
  it 'can get a list of all projects for a neighborhood' do
    hood = create(:district)
    create_list(:project, 4)

    get "/api/v1/neighborhoods/#{hood.id}"

    expect(response).to be_successful

    projects = JSON.parse(response.body)

  end
end
