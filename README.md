## Neighborhood API

### Endpoints:
`GET /api/v1/neighborhoods` - returns id and name for all neighborhoods(districts)  

`GET /api/v1/neighborhoods/:id` - returns is and name for one neighborhood, along with all projects for that neighborhood including id, title, description, and photo(url)  

`GET /api/v1/projects` - returns id, title, description, photo url, and resources for every project. Resources include id, name and status.  

`PATCH /api/v1/projects/:id` - Updates a project and/or it's resources. If a resource is entered with only a name, a new one will be created, if you give it an id of an existing resource then it will be updated.  
In the example below, the first two resources will be updated and the last created.   
It needs to be in the following format:  
```
{ project: {
              title: "build a statue",
              description: "We out here building a statue",
              photo: "https://aphotoofadamnstatue.com/statue",
              resources: [
                {
                  id: 1,
                  status: "fulfilled"
                },
                {
                  id: 2,
                  name: "100 laborers",
                  status: "fulfilled"
                },
                {
                  name: "15 beers"
                }
              ]
            }
          }
```
`GET /api/v1/users` - returns id, first_name, last_name, username, district_id, email, and photo url for all users

`POST /api/v1/users` - returns id, first_name, last_name, username, neighborhood, email, and photo for google oauth user  
* creates and returns user if user doesn't exist
* returns the user if user already exists  
```
  {
    first_name: 'steve',
    last_name: 'malek',
    email: 'stevanator@gmail.com',
    username: 'stevie12',
    district_id: 1,
    token: 'asdfsdfasdfasdfafsdfadfa'
  }
```

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
