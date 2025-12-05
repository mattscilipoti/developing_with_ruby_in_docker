# Additional Resources

A curated collection of resources for learning more about Docker, Ruby development, and DevContainers.

## 📺 Video Tutorials

### Docker Basics
- [Docker Tutorial for Beginners](https://www.youtube.com/watch?v=fqMOX6JJhGo) - A comprehensive introduction
- [Docker in 100 Seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ) - Quick overview

### VS Code DevContainers
- [VS Code Dev Containers: A Better Way to Develop](https://www.youtube.com/watch?v=Mi8-gQ9VRks)
- [Getting Started with Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)

### Ruby and Docker
- [Ruby on Docker Best Practices](https://dev.to/search?q=ruby%20docker)
- [Rails with Docker Compose](https://www.youtube.com/results?search_query=rails+docker+compose)

## 📖 Documentation

### Official Docs
- [Docker Documentation](https://docs.docker.com/)
  - [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
  - [Docker Compose](https://docs.docker.com/compose/)
  - [Best Practices](https://docs.docker.com/develop/dev-best-practices/)

- [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview)
  - [DevContainers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
  - [DevContainer Specification](https://containers.dev/)
  - [devcontainer.json Reference](https://containers.dev/implementors/json_reference/)

- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
  - [Ruby Style Guide](https://rubystyle.guide/)
  - [RubyGems](https://rubygems.org/)

### Ruby Framework Specific
- [Rails Guides](https://guides.rubyonrails.org/)
- [Sinatra Documentation](http://sinatrarb.com/documentation.html)
- [Hanami Guides](https://guides.hanamirb.org/)

## 🛠️ Tools and Extensions

### VS Code Extensions for Ruby
- **Ruby** (rebornix.ruby) - Ruby language support
- **Ruby Solargraph** (castwide.solargraph) - IntelliSense and code completion
- **endwise** (kaiwood.endwise) - Auto-add 'end' keyword
- **Ruby Test Explorer** (connorshea.vscode-ruby-test-adapter) - Run tests in sidebar
- **Rails** (bung87.rails) - Rails support

### VS Code Extensions for Docker
- **Docker** (ms-azuretools.vscode-docker) - Docker support
- **Remote - Containers** (ms-vscode-remote.remote-containers) - DevContainers
- **YAML** (redhat.vscode-yaml) - docker-compose.yml support

### Command Line Tools
- [Docker Compose](https://docs.docker.com/compose/install/) - Multi-container orchestration
- [Hadolint](https://github.com/hadolint/hadolint) - Dockerfile linter
- [dive](https://github.com/wagoodman/dive) - Docker image layer explorer
- [ctop](https://github.com/bcicen/ctop) - Container monitoring

## 📦 Pre-built Docker Images

### Official Ruby Images
- [Ruby on Docker Hub](https://hub.docker.com/_/ruby)
- [Microsoft DevContainer Images](https://github.com/devcontainers/images/tree/main/src/ruby)

### Popular Base Images
- `ruby:3.2` - Latest Ruby 3.2
- `ruby:3.2-alpine` - Lightweight Alpine Linux
- `ruby:3.2-slim` - Minimal Debian image
- `mcr.microsoft.com/devcontainers/ruby:3.2` - Microsoft's DevContainer image

## 💡 Example Projects and Templates

### GitHub Repositories
- [vscode-dev-containers](https://github.com/microsoft/vscode-dev-containers) - Microsoft's official templates
- [devcontainers/templates](https://github.com/devcontainers/templates) - Community templates
- [dockersamples](https://github.com/dockersamples) - Docker official examples

### Starter Templates
- [Ruby Sinatra DevContainer](https://github.com/devcontainers/templates/tree/main/src/ruby-sinatra)
- [Rails DevContainer Template](https://github.com/rails/docked)
- [Jekyll DevContainer](https://github.com/devcontainers/templates/tree/main/src/jekyll)

## 📚 Books and Courses

### Docker
- **"Docker Deep Dive"** by Nigel Poulton
- **"Docker in Action"** by Jeff Nickoloff
- [Docker for Beginners (Free)](https://docker-curriculum.com/)

### Ruby
- **"The Well-Grounded Rubyist"** by David A. Black
- **"Ruby on Rails Tutorial"** by Michael Hartl (Free online)
- [Ruby Koans](https://www.rubykoans.com/) - Interactive learning

## 🌐 Community Resources

### Forums and Communities
- [Docker Community Forums](https://forums.docker.com/)
- [Ruby Discord Server](https://discord.gg/ruby)
- [Ruby Reddit](https://www.reddit.com/r/ruby/)
- [Stack Overflow - Docker Tag](https://stackoverflow.com/questions/tagged/docker)
- [Stack Overflow - Ruby Tag](https://stackoverflow.com/questions/tagged/ruby)

### Blogs and Articles
- [Docker Blog](https://www.docker.com/blog/)
- [Ruby Weekly Newsletter](https://rubyweekly.com/)
- [Dev.to - Ruby Tag](https://dev.to/t/ruby)
- [Dev.to - Docker Tag](https://dev.to/t/docker)

## 🎓 Online Courses

### Free Courses
- [Docker Tutorial (YouTube)](https://www.youtube.com/watch?v=fqMOX6JJhGo)
- [Learn Ruby (Codecademy)](https://www.codecademy.com/learn/learn-ruby)
- [Ruby in 20 Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)

### Paid Courses
- [Docker Mastery (Udemy)](https://www.udemy.com/course/docker-mastery/)
- [The Complete Ruby on Rails Developer (Udemy)](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/)
- [Docker Deep Dive (Pluralsight)](https://www.pluralsight.com/courses/docker-deep-dive)

## 🔧 Development Tools

### Ruby Version Managers
While not needed with Docker, these are useful to know:
- [rbenv](https://github.com/rbenv/rbenv) - Ruby version manager
- [RVM](https://rvm.io/) - Ruby Version Manager
- [asdf](https://asdf-vm.com/) - Multi-language version manager

### Testing Frameworks
- [RSpec](https://rspec.info/) - BDD testing framework
- [Minitest](https://github.com/seattlerb/minitest) - Complete test suite
- [Cucumber](https://cucumber.io/) - BDD with natural language

### Code Quality
- [RuboCop](https://github.com/rubocop/rubocop) - Ruby static code analyzer
- [Reek](https://github.com/troessner/reek) - Code smell detector
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) - Code coverage

## 🚀 Advanced Topics

### Kubernetes and Container Orchestration
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Docker Swarm](https://docs.docker.com/engine/swarm/)

### CI/CD with Docker
- [GitHub Actions with Docker](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images)
- [GitLab CI with Docker](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html)
- [CircleCI Docker](https://circleci.com/docs/using-docker/)

### Production Deployment
- [Docker Security Best Practices](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
- [Multi-stage Builds](https://docs.docker.com/build/building/multi-stage/)
- [Docker Registry](https://docs.docker.com/registry/)

## 📱 Stay Updated

### Newsletters
- [Docker Weekly](https://www.docker.com/newsletter-subscription)
- [Ruby Weekly](https://rubyweekly.com/)
- [DevOps Weekly](https://www.devopsweekly.com/)

### Twitter/X Accounts to Follow
- [@docker](https://twitter.com/docker)
- [@code](https://twitter.com/code) - VS Code
- [@ruby_lang](https://twitter.com/ruby_lang)
- [@rails](https://twitter.com/rails)

## 🤝 Contributing

Found a great resource? [Submit a pull request](https://github.com/mattscilipoti/developing_with_ruby_in_docker/pulls) to add it to this list!
