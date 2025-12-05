#!/usr/bin/env ruby
require 'colorize'

puts "=" * 50
puts "Welcome to Ruby in Docker!".colorize(:green).bold
puts "=" * 50
puts

puts "Ruby version: #{RUBY_VERSION}".colorize(:cyan)
puts "Running from: #{`hostname`.strip}".colorize(:cyan)
puts

puts "This Ruby script is running inside a Docker container!".colorize(:yellow)
puts "All dependencies are managed in the container.".colorize(:yellow)
puts

puts "Try modifying this file and see the changes instantly!".colorize(:magenta)
