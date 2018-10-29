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

`POST /api/v1/users` - returns id, first_name, last_name, username, neighborhood, email, and photo for user signing up through neighborhood kickstarter app  
* if user already exists, it updates password and signs user in   
* if user doesn't exist and passed all correct params it creates new user  
```
  {
    first_name: 'steve',
    last_name: 'malek',
    email: 'stevemalek@gmail.com',
    username: 'stevie12',
    district_id: neighborhood.id,
    password: 'bluesky'
  }
```

`POST /api/v1/google_users` - returns id, first_name, last_name, username, neighborhood, email, and photo for google oauth user  
* creates and returns user if user doesn't exist
* returns the user if user already exists  
* send json in the following format:  
```
  {
    first_name: 'steve',
    last_name: 'malek',
    email: 'stevanator@gmail.com',
    username: 'stevie12',
    district_id: 1,
    password: 'asdfsdfasdfasdfafsdfadfa'
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

`GET /api/v1/projects/:project_id/comments` - get all comments for a specific projects
* will return comment id, author username, content, and timestamps
```
  [
    { 'id': 1,
      'author': 'bob',
      'content': 'blah blah',
      'created_at': 'some time',
      'updated_at': 'some time'
    },
    { 'id': 2,
      'author': 'dan',
      'content': 'blah blah',
      'created_at': 'some time',
      'updated_at': 'some time'
    }
  ]
```
