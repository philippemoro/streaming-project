# README

### Require

* Ruby version: 2.6.6
* Rails version: 6.0.3
* Postgresql


### Running the API with docker
1. Make sure you have ports :3000 and :5432 available
2. Run `$docker-compose up -d`
3. Done, API should be up accepting requests on `localhost:3000`


### Running tests with docker

The following will run the rspec test suite
```
$docker-compose up -d
$docker-compose run -e RAILS_ENV=test --rm app bundle exec rspec
```

### Available routes
![image](https://user-images.githubusercontent.com/28736591/111831489-3ba14f80-88ce-11eb-968b-9e7a34f06b99.png)

```
movies GET    /movies
Description: Index for movies
Accepted Params: page, per_page
```

```
seasons GET    /seasons
Description: Index for seasons
Accepted Params: page, per_page
```

```
content_purchase_option_purchases POST   /contents/:content_id/purchase_options/:purchase_option_id/purchases
Description: Create a purchase for that purchase_option
Accepted Params: user_id, purchase_option_id
```

```
contents GET    /contents
Description: Index for contents (Seasons + Movies)
Accepted Params: page, per_page
```

```
library_user GET    /users/:id/library
Description: User library, it shows user not expired purchases
Accepted Params: id, page, per_page
```




### ERD Diagram

![image](https://user-images.githubusercontent.com/28736591/111749400-7a082180-8870-11eb-8dc0-2db9e0ae7c90.png)
