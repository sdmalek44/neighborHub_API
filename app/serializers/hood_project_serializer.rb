class HoodProjectSerializer
  def initialize(projects)
    @projects = projects
  end

  def serialize
    @projects.map do |project|
      {
        id: project.id,
        title: project.title,
        description: project.description,
        photo: project.photo,
        neighbor: project.owner,
        contact: project.contact,
        resources: resources_json(project.resources)
      }
    end
  end

  def resources_json(resources)
    resources.map do |resource|
      {id: resource.id, name: resource.name, status: resource.status }
    end
  end

end
