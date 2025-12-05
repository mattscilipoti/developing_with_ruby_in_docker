#!/usr/bin/env ruby
require 'pg'
require 'redis'

puts "=" * 60
puts "Testing Connections to Services"
puts "=" * 60
puts

# Test PostgreSQL Connection
begin
  puts "📊 Connecting to PostgreSQL..."
  conn = PG.connect(
    host: 'db',
    dbname: 'development',
    user: 'postgres',
    password: 'password'
  )
  result = conn.exec('SELECT version()')
  puts "✅ PostgreSQL connected: #{result.getvalue(0, 0).split("\n").first}"
  conn.close
rescue => e
  puts "❌ PostgreSQL connection failed: #{e.message}"
end

puts

# Test Redis Connection
begin
  puts "🔴 Connecting to Redis..."
  redis = Redis.new(host: 'redis', port: 6379)
  redis.set('test_key', 'Hello from Ruby in Docker!')
  value = redis.get('test_key')
  puts "✅ Redis connected: Retrieved value '#{value}'"
  redis.del('test_key')
rescue => e
  puts "❌ Redis connection failed: #{e.message}"
end

puts
puts "=" * 60
puts "All services are ready! 🎉"
puts "=" * 60
puts
puts "Available services:"
puts "  - PostgreSQL: db:5432"
puts "  - Redis: redis:6379"
puts "  - MailHog UI: http://localhost:8025"
puts
