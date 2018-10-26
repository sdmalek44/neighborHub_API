## Neighborhood API

### Endpoints:
`GET /api/v1/neighborhoods` - returns id and name for all neighborhoods(districts)  

`GET /api/v1/neighborhoods/:id` - returns is and name for one neighborhood, along with all projects for that neighborhood including id, title, description, and photo(url)  

`GET /api/v1/projects` - returns id, title, description, photo url, and resources for every project. Resources include id, name and status.  

`PATCH /api/v1/projects/:id` - Updates a project and/or it's resources. It needs to be in the following format:  
```
  {
    project:
      {
        title: "build a statue",
        description: "We out here building a statue",
        photo: "https://aphotoofastatue.com/statue",
        resources: [
          {
            id: resources[0].id,
            name: "500 lbs of concrete",
            status: "fulfilled"
          },
          {
            id: resources[1].id,
            name: "100 laborers",
            status: "fulfilled"
          }
        ]
      }
  }
```
`GET /api/v1/users` - returns id, first_name, last_name, username, district_id, email, and photo url for all users  

`GET /api/v1/users/:user_id/projects` - returns all projects for user with user_id, including resources  

`POST /api/v1/users/:user_id/projects` - needs to be in the following format:<br>  
```
  {
    project: {
      title: "build a statue",
      description: "We out here building a statue",
      photo: "https://aphotoofastatue.com/statue",
      resources: [
        {
          name: "500 lbs of concrete",
        },
        {
          name: "100 laborers"
        }
      ]
    }
  }
```
