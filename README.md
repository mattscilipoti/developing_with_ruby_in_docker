# Developing with Ruby in Docker

A comprehensive presentation and resource collection for learning how to develop Ruby applications using Docker and VS Code DevContainers.

## 📺 Presentation

View the interactive presentation online:
**[https://mattscilipoti.github.io/developing_with_ruby_in_docker/](https://mattscilipoti.github.io/developing_with_ruby_in_docker/)**

The presentation covers:
- Introduction to Docker and containers
- Benefits of using Docker for Ruby development
- VS Code DevContainers overview
- Step-by-step setup guides
- Working with DevContainers
- Best practices and troubleshooting
- Resources for continued learning

**Duration:** Approximately 20 minutes

## 📁 Example Projects

This repository includes three practical examples to help you get started:

### 1. Basic Ruby (`examples/basic-ruby/`)
A minimal setup demonstrating:
- Simple Ruby application in a container
- Basic DevContainer configuration
- Using pre-built Ruby images

### 2. Rails with PostgreSQL (`examples/rails-postgres/`)
A complete Rails development environment with:
- Rails framework
- PostgreSQL database
- Docker Compose multi-container setup
- Database configuration examples

### 3. Ruby with Multiple Services (`examples/ruby-with-services/`)
An advanced setup showing:
- Ruby app with PostgreSQL, Redis, and MailHog
- Service orchestration with Docker Compose
- Connection examples for each service
- Ideal for microservices or complex apps

## 🚀 Quick Start

1. **Prerequisites:**
   - Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - Install [VS Code](https://code.visualstudio.com/)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Try an example:**
   ```bash
   cd examples/basic-ruby
   code .
   # When VS Code opens, click "Reopen in Container"
   ```

3. **Run the application:**
   ```bash
   bundle install
   ruby app.rb
   ```

## 📚 Resources

### Official Documentation
- [VS Code DevContainers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Documentation](https://docs.docker.com/)
- [Ruby Official Documentation](https://www.ruby-lang.org/en/documentation/)

### Community Templates
- [Microsoft's DevContainer Templates](https://github.com/microsoft/vscode-dev-containers)
- [DevContainers Community Templates](https://github.com/devcontainers/templates)

## 🎯 Target Audience

This presentation is designed for:
- Beginners to Docker and containerization
- Ruby developers looking to improve their development workflow
- Teams wanting to standardize development environments
- Anyone interested in VS Code DevContainers

No prior Docker experience required!

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report issues or suggestions
- Submit pull requests with improvements
- Share your own DevContainer configurations

## 📄 License

See [LICENSE](LICENSE) file for details.
