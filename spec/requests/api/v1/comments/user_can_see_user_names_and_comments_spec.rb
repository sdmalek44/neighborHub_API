require 'rails_helper'

describe '/api/v1' do
  context 'GET /api/v1/project/:project_id/comments' do
    it "user can see all comments for project and associated user name" do
      project = create(:project)
      create(:district)
      user = create(:user)
      comments = create_list(:comment, 4)
      comment = comments.first

      get "/api/v1/projects/#{project.id}/comments"

      expect(response).to be_successful
      new_comments = JSON.parse(response.body, symbolize_names: true)
      new_comment = new_comments.first

      expect(new_comments.count).to eq(4)
      expect(new_comment[:id]).to eq(comment.id)
      expect(new_comment[:author]).to be_a(String)
      expect(new_comment[:content]).to eq(comment.content)
      expect(new_comment[:updated_at]).to be_a(String)
      expect(new_comment[:created_at]).to be_a(String)
    end
    it 'puts in wrong project id for comments' do
      get "/api/v1/projects/5/comments"

      expect(response.status).to eq(404)
      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:message]).to eq('Project Not Found!')
    end
  end
end
