

require 'csv'

CSV.foreach('./db/csv/statistical_neighborhoods.csv', headers: true, header_converters: :symbol) do |district|
  District.create(name: district[:nbhd_name])
end

User.create(first_name: 'Bob',
            last_name: 'Jones',
            username: 'bobjones',
            district_id: 1,
            email: "bobjones@email.com",
            photo: 'photo.com',
            password: 'thing')
User.create(first_name: 'Mary',
            last_name: 'Smith',
            username: 'marysmith',
            district_id: 2,
            email: "marysmith@email.com",
            photo: 'photo.com',
            password: 'thang')
User.create(first_name: 'Fred',
            last_name: 'Brown',
            username: 'fredbrown',
            district_id: 3,
            email: "fredbrown@email.com",
            photo: 'photo.com',
            password: 'thing')
User.create(first_name: 'Kate',
            last_name: 'Geen',
            username: 'kategreen',
            district_id: 4,
            email: "kategreen@email.com",
            photo: 'photo.com',
            password: 'fun')

Project.create(title: 'Mow my grass',
              description: 'Mow the entire lawn, front and back')

Project.create(title: 'Fix my door',
              description: 'Fix the hinges on front door')

Project.create(title: 'Build a bench',
              description: 'Build a new bench for bustop')

Project.create(title: 'Paint the community center',
              description: "The community center looks crappy, let's paint it!")

UserProject.create(user_id: 1, project_id: 1, project_role: 1)
UserProject.create(user_id: 2, project_id: 2, project_role: 1)
UserProject.create(user_id: 3, project_id: 3, project_role: 1)
UserProject.create(user_id: 4, project_id: 4, project_role: 1)
UserProject.create(user_id: 2, project_id: 1)
UserProject.create(user_id: 4, project_id: 3)

Resource.create(name: 'Lawnmower', project_id: 1)
Resource.create(name: 'Hammer', project_id: 2)
Resource.create(name: 'Nails', project_id: 2)
Resource.create(name: 'Lumber', project_id: 3)
Resource.create(name: 'Screwdriver and Screws', project_id: 3)
Resource.create(name: 'Paint', project_id: 4)
Resource.create(name: 'Paintbrushes, dropcloths, etc', project_id: 4)


Comment.create(content: 'hey heres $20', project_id: 1, user_id: 1)
Comment.create(content: 'I have a lawnmower you can use', user_id: 2, project_id: 2)
Comment.create(content: 'I can give you some help saturday', user_id: 3, project_id: 3)
Comment.create(content: 'I cant help but I can watch', user_id: 4, project_id: 4)
Comment.create(content: 'What day are you planning on?', user_id: 2, project_id: 1)
