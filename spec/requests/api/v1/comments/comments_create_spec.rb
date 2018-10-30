require 'rails_helper'

describe 'POST /api/v1/project/:id/comments' do
  it 'can create a new comment for a project' do
    project = create(:project)
    hood = create(:district)
    user = create(:user, district_id: hood.id)

    headers = {
      "Content-Type": 'application/json',
      "Accept": 'application/json'
    }

    body = {user_id: user.id,
            content: "I can help with labor on Saturday"}

    post "/api/v1/projects/#{project.id}/comments", params: body.to_json, headers: headers

    comment = JSON.parse(response.body)

    expect(comment['id']).to eq(1)
    expect(comment['user_id']).to eq(user.id)
    expect(comment['project_id']).to eq(project.id)
  end
  it 'cannot create without user id' do
    project = create(:project)

    headers = {
      "Content-Type": 'application/json',
      "Accept": 'application/json'
    }

    body = {content: "I can help with labor on Saturday"}

    post "/api/v1/projects/#{project.id}/comments", params: body.to_json, headers: headers

    comment = JSON.parse(response.body)

    expect(comment['message']).to eq("Unable to create comment")
    expect(response.status).to eq(400)
  end
end
