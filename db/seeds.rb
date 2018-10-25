# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

District.create(name: 'Wash Park')
District.create(name: 'Grove Street')
District.create(name: 'LoDo')
District.create(name: 'LoHi')

User.create(first_name: 'Bob',
            last_name: 'Jones',
            username: 'bobjones',
            district_id: 1,
            email: "bobjones@email.com",
            photo: 'photo.com')
User.create(first_name: 'Mary',
            last_name: 'Smith',
            username: 'marysmith',
            district_id: 2,
            email: "marysmith@email.com",
            photo: 'photo.com')
User.create(first_name: 'Fred',
            last_name: 'Brown',
            username: 'fredbrown',
            district_id: 3,
            email: "fredbrown@email.com",
            photo: 'photo.com')
User.create(first_name: 'Kate',
            last_name: 'Geen',
            username: 'kategreen',
            district_id: 4,
            email: "kategreen@email.com",
            photo: 'photo.com')

Project.create(title: 'Mow my grass',
              description: 'Mow the entire lawn, front and back',
              photo: 'photo.com')
Project.create(title: 'Fix my door',
              description: 'Fix the hinges on front door',
              photo: 'photo.com')
Project.create(title: 'Build a bench',
              description: 'Build a new bench for bustop',
              photo: 'photo.com')
Project.create(title: 'Paint the community center',
              description: "The community center looks crappy, let's paint it!",
              photo: 'photo.com')

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
