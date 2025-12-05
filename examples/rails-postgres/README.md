# Rails with PostgreSQL DevContainer Example

This example demonstrates a more complex setup with Rails and PostgreSQL using Docker Compose.

## Structure

```
rails-postgres/
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile
├── docker-compose.yml
└── README.md (this file)
```

## Getting Started

1. Install Docker Desktop
2. Install VS Code with Dev Containers extension
3. Open this folder in VS Code
4. When prompted, click "Reopen in Container"
5. Wait for the containers to build
6. Create a new Rails app or use your existing one:
   ```bash
   rails new myapp --database=postgresql
   cd myapp
   # Update config/database.yml with the correct host (db)
   rails db:create
   rails server
   ```

## What's Included

- Ruby 3.2
- Rails (installed via bundler)
- PostgreSQL 15
- Node.js (for asset compilation)
- Ruby development extensions

## Services

- **app**: Your Rails application container
- **db**: PostgreSQL database container

## Database Configuration

Update your `config/database.yml`:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: myapp_development

test:
  <<: *default
  database: myapp_test
```

## Useful Commands

```bash
# Database operations
rails db:create
rails db:migrate
rails db:seed

# Start the server
rails server -b 0.0.0.0

# Run console
rails console

# Run tests
rails test
```
