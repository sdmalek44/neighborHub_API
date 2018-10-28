require 'rails_helper'

describe 'GET /api/v1/neighborhoods/:id' do
  it 'can get a list of all projects for a neighborhood' do
    hood = create(:district)
    user = create(:user, district_id: hood.id)
    project1 = create(:project)
    project2 = create(:project)
    UserProject.create(user_id: user.id, project_id: project1.id)
    UserProject.create(user_id: user.id, project_id: project2.id)
    resource1 = project1.resources.create(name: 'thing')
    project1.resources.create(name: 'thing2')
    project2.resources.create(name: 'thing3')

    get "/api/v1/neighborhoods/#{hood.id}"

    expect(response).to be_successful

    district = JSON.parse(response.body, symbolize_names: true)
    project = district[:projects].first
    resource = project[:resources].first

    expect(district[:id]).to eq(hood.id)
    expect(district[:name]).to eq(hood.name)
    expect(district[:projects].count).to eq(2)

    expect(project[:id]).to eq(project1.id)
    expect(project[:title]).to eq(project1.title)
    expect(project[:description]).to eq(project1.description)
    expect(project[:photo]).to eq(project1.photo)
    expect(project[:neighbor]).to eq(user.first_name)
    expect(project[:contact]).to eq(user.email)
    expect(project[:resources].count).to eq(2)

    expect(resource[:id]).to eq(resource1.id)
    expect(resource[:name]).to eq(resource1.name)
    expect(resource[:status]).to eq(resource1.status)
  end
  it 'returns a 404 if not found' do

    get "/api/v1/neighborhoods/1"

    expect(response.status).to eq(404)
  end

end
