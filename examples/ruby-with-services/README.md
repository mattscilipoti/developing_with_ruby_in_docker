# Ruby with Multiple Services Example

This example shows how to set up a Ruby development environment with multiple supporting services.

## Structure

```
ruby-with-services/
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile
├── docker-compose.yml
├── app.rb
└── README.md (this file)
```

## Services Included

- **app**: Ruby application container
- **db**: PostgreSQL database
- **redis**: Redis cache/queue
- **mailhog**: Email testing service (optional)

## Getting Started

1. Open this folder in VS Code
2. Reopen in Container (F1 → "Dev Containers: Reopen in Container")
3. Wait for all containers to start
4. Run the example app:
   ```bash
   bundle install
   ruby app.rb
   ```

## Service Access

- PostgreSQL: `localhost:5432` (host: `db` from app)
- Redis: `localhost:6379` (host: `redis` from app)
- MailHog UI: `http://localhost:8025`

## Configuration Examples

### PostgreSQL Connection

```ruby
require 'pg'

conn = PG.connect(
  host: 'db',
  dbname: 'development',
  user: 'postgres',
  password: 'password'
)
```

### Redis Connection

```ruby
require 'redis'

redis = Redis.new(host: 'redis', port: 6379)
redis.set('key', 'value')
puts redis.get('key')
```

## Use Cases

This setup is ideal for:
- Background job processing (Sidekiq)
- Caching layers
- Session storage
- Email testing during development
- Microservices development
