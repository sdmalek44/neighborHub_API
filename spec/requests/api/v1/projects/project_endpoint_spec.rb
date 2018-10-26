require 'rails_helper'

describe '/api/v1' do
  context '/projects' do
    it 'GET /api/v1/projects' do
      create_list(:project, 4)
      get '/api/v1/projects'

      expect(response).to be_successful

      projects = JSON.parse(response.body)

      expect(projects.count).to eq(4)
      expect(projects[0]['id']).to eq(1)
      expect(projects[0]['title']).to be_a(String)
      expect(projects[0]['description']).to be_a(String)
      expect(projects[0]['photo']).to be_a(String)
    end
    it 'PATCH /api/v1/projects/:id' do
      project = create(:project)
      resources = create_list(:resource, 2)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }


      payload = { project: {
                    title: "build a statue",
                    description: "We out here building a statue",
                    photo: "https://aphotoofadamnstatue.com/statue",
                    resources: [
                      {
                        id: resources[0].id,
                        status: "fulfilled"
                      },
                      {
                        id: resources[1].id,
                        name: "100 laborers",
                        status: "fulfilled"
                      },
                      {
                        name: "15 beers"
                      }
                    ]
                  }
                }
      patch "/api/v1/projects/#{project.id}", params: payload.to_json, headers: headers

      expect(response.status).to eq(200)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:message]).to eq("Successfully Updated #{payload[:project][:title]}!")
      updated_project  = Project.find(project.id)
      expect(updated_project.title).to eq(payload[:project][:title])
      expect(updated_project.description).to eq(payload[:project][:description])
      expect(updated_project.photo).to eq(payload[:project][:photo])

      updated_resource = updated_project.resources[0]

      expect(updated_project.resources.length).to eq(3)
      expect(updated_resource.id).to eq(resources[0].id)
      expect(updated_resource.name).to eq(resources[0].name)
      expect(updated_resource.status).to eq(payload[:project][:resources][0][:status])

      new_resource = Resource.all.last
      expect(new_resource.id).to eq(3)
      expect(new_resource.name).to eq(payload[:project][:resources][2][:name])
      expect(new_resource.status).to eq("unfulfilled")
    end
    it 'PATCH /api/v1/projects/:id sad path' do
      project = create(:project)
      resources = create_list(:resource, 2)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }


      payload = { project: {
                    title: "build a statue",
                    description: "We out here building a statue",
                    photo: "https://aphotoofadamnstatue.com/statue",
                    resources: [
                      {
                        id: resources[0].id,
                        name: "500 lbs of concrete",
                        status: "fulfilled"
                      },
                      {
                        name: "100 laborers",
                        status: "fulfilled"
                      }
                    ]
                  }
                }
      patch "/api/v1/projects/#{project.id}", params: payload.to_json, headers: headers

      expect(response.status).to eq(400)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:message]).to eq("Invalid Input. Try Again")
    end
  end
end
