# :house:	**THE NEIGHBORHOOD API**
## Endpoints

- [Neighborhoods](#Neighborhoods)
- [Projects](#Projects)
- [Comments](#Comments)
- [Users](#Users)


## Neighborhoods
### GET /api/v1/neighborhoods
  - returns id and name for all neighborhoods(districts) will be displayed in alphabetical order
  
```json
[
    {
        "id": 24,
        "name": "Athmar Park"
    },
    {
        "id": 1,
        "name": "Auraria"
    },
    {
        "id": 70,
        "name": "Baker"
    }
 ]
 ```

### GET /api/v1/neighborhoods/:id
  - returns id and name for one neighborhood, along with all projects for that neighborhood 
  - each product will include id, title, description, and photo(url)
  - `404: Not Found` will be returned if the id is not found
  
```json
{
    "id": 4,
    "name": "Washington Park",
    "projects": [
        {
            "id": 4,
            "title": "Paint the community center",
            "description": "The community center looks crappy, let's paint it!",
            "photo": "https://screenshotlayer.com/images/assets/placeholder.png",
            "neighbor": "Kate",
            "contact": "kategreen@email.com",
            "resources": [
                {
                    "id": 6,
                    "name": "Paint",
                    "status": "unfulfilled"
                },
                {
                    "id": 7,
                    "name": "Paintbrushes, dropcloths, etc",
                    "status": "unfulfilled"
                }
            ]
        }
    ]
}
```

## Projects
### GET /api/v1/projects
  - returns id, title, description, photo url, and resources for every project
  - resources associated with each project will include id, name and status
  
  ```json
  [
    {
        "id": 1,
        "title": "Mow my grass",
        "description": "Mow the entire lawn, front and back",
        "photo": "https://screenshotlayer.com/images/assets/placeholder.png",
        "owner_id": 1,
        "resources": [
            {
                "id": 1,
                "name": "Lawnmower",
                "status": "unfulfilled"
            }
        ]
    },
    {
        "id": 2,
        "title": "Fix my door",
        "description": "Fix the hinges on front door",
        "photo": "https://screenshotlayer.com/images/assets/placeholder.png",
        "owner_id": 2,
        "resources": [
            {
                "id": 2,
                "name": "Hammer",
                "status": "unfulfilled"
            },
            {
                "id": 3,
                "name": "Nails",
                "status": "unfulfilled"
            }
        ]
    }
 ]
 ```

### PATCH /api/v1/projects/:id
- update a project and/or it's resources 
- enter only resource_name and a new record in the database will be created
- pass in the :id of an existing resource and the record will be updated

```json
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

- if you just wanted to update a status to fulfilled

```json
{
  "project": {
              "resources": [
                {
                  "id": 1,
                  "status": 'fulfilled'
                }
              ]
            }
}
```

### GET /api/v1/projects/:project_id/comments 
- get all comments for a specific projects
- return comment id, author username, content, and timestamps

```json
[
    {
        "id": 4,
        "author": "Bob",
        "content": "I am available on Saturday to help!",
        "created_at": "2018-10-30T15:46:20.357Z",
        "updated_at": "2018-10-30T15:46:20.357Z"
    }
]
```

## Users
### GET /api/v1/users 
- returns id, first_name, last_name, username, district_id, email, and photo url for all users

```json
[
    {
        "id": 1,
        "first_name": "Bob",
        "last_name": "Jones",
        "username": "bobjones",
        "email": "bobjones@email.com",
        "neighborhood": "Auraria",
        "photo": "photo.com"
    },
    {
        "id": 2,
        "first_name": "Mary",
        "last_name": "Smith",
        "username": "marysmith",
        "email": "marysmith@email.com",
        "neighborhood": "Cory - Merrill",
        "photo": "photo.com"
    },
    {
        "id": 3,
        "first_name": "Fred",
        "last_name": "Brown",
        "username": "fredbrown",
        "email": "fredbrown@email.com",
        "neighborhood": "Belcaro",
        "photo": "photo.com"
    },
    {
        "id": 4,
        "first_name": "Kate",
        "last_name": "Geen",
        "username": "kategreen",
        "email": "kategreen@email.com",
        "neighborhood": "Washington Park",
        "photo": "photo.com"
    }
]
```

### POST /api/v1/users 
- returns id, first_name, last_name, username, neighborhood, email, and photo for user signing up via kickstarter app
- if user exists, it updates password and signs user in
- if user doesn't exist and all correct params are passed in, a new user is created

```json
{
    first_name: 'steve',
    last_name: 'malek',
    email: 'stevemalek@gmail.com',
    username: 'stevie12',
    district_id: neighborhood.id,
    password: 'bluesky'
 }
 ```
### POST /api/v1/google_users 

- returns the user if user already exists
- creates and returns user if user doesn't exist
- submit json data in the following format
- returns id, first_name, last_name, username, neighborhood, email, and photo for google oauth user

```json
  {
    first_name: 'steve',
    last_name: 'malek',
    email: 'stevanator@gmail.com',
    username: 'stevie12',
    district_id: 1,
    password: 'asdfsdfasdfasdfafsdfadfa'
  }
```
### GET /api/v1/users/:user_id/projects 
- returns all projects for user with user_id, including resources

### POST /api/v1/users/:user_id/projects 
- submission should be in the following format:

```json
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