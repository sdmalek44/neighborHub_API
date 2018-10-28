require 'rails_helper'

describe 'GET /api/v1/neighborhoods/:id' do
  it 'can get a list of all projects for a neighborhood' do
    hood = create(:district)
    user = create(:user, district_id: hood.id)
    project1 = create(:project)
    project2 = create(:project)
    UserProject.create(user_id: user.id, project_id: project1.id)
    UserProject.create(user_id: user.id, project_id: project2.id)


    get "/api/v1/neighborhoods/#{hood.id}"

    expect(response).to be_successful

    district = JSON.parse(response.body)

    expect(district["id"]).to eq(hood.id)
    expect(district["name"]).to eq(hood.name)
    expect(district["projects"].count).to eq(2)
  end
  it 'returns a 404 if not found' do

    get "/api/v1/neighborhoods/1"

    expect(response.status).to eq(404)
  end

end
