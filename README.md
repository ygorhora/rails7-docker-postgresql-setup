## Ruby on Rails 7 Auto Setup with PostgreSQL

1. Download the project first or git clone.
```
 git clone <repo>
```

2. Change directory
```
 cd <repo>
```

3. Update your rails version on the Gemfile
```
source 'https://rubygems.org'
gem 'rails', '7.0.3'
```

4. Update Ruby version on Dockerfile (and Dockerfile.app)
```
FROM  ruby:3.1.2-slim
```

5. Run
```
make setup_rails
```

6. Update database details on project/config/database.yml file.
```
default: &default
  adapter: postgresql
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV['DB_USERNAME'] || 'postgres' %>
  password: <%= ENV['DB_PASSWORD'] || 'postgres' %>
  host: <%= ENV['DB_HOST'] || 'db' %>
  port: <%= ENV['DB_PORT'] || 5432 %>

development:
  <<: *default
  database: dev

test:
  <<: *default
  database: dev
```

7. Run
```
make rails_up
```
wait and it should show
```
Listening on http://0.0.0.0:3000
```
and test this access. You must succeed.

8. Shutdown project
```
make project_down
```

9. Move the started project to desired directory
```
mv ./project <desired-directory>
```

10. You can start work on your project
```
cd <desired-directory> && docker compose up
```