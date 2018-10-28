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
        resources: project.resources.map {|resource| {id: resource.id, name: resource.name, status: resource.status}}
      }
    end
  end
end
