# Troubleshooting Guide

Common issues and solutions when developing Ruby applications with Docker and VS Code DevContainers.

## Table of Contents
- [Container Issues](#container-issues)
- [Performance Issues](#performance-issues)
- [Network and Port Issues](#network-and-port-issues)
- [File System Issues](#file-system-issues)
- [Ruby-Specific Issues](#ruby-specific-issues)
- [VS Code Issues](#vs-code-issues)
- [Docker Desktop Issues](#docker-desktop-issues)

---

## Container Issues

### Container Won't Build

**Symptoms:** Build fails with errors, container doesn't start

**Solutions:**
1. Check Docker Desktop is running
2. View detailed logs:
   ```
   F1 → Dev Containers: Show Container Log
   ```
3. Rebuild without cache:
   ```
   F1 → Dev Containers: Rebuild Container Without Cache
   ```
4. Check Dockerfile syntax if using custom Dockerfile
5. Verify base image exists:
   ```bash
   docker pull ruby:3.2
   ```

### Container Starts But Exits Immediately

**Symptoms:** Container builds successfully but doesn't stay running

**Solutions:**
1. Check if Dockerfile has a proper CMD or ENTRYPOINT
2. For DevContainers, the default is `sleep infinity` - don't override this
3. View container logs:
   ```bash
   docker logs <container-id>
   ```

### "Cannot connect to Docker daemon"

**Symptoms:** Error message about Docker daemon not running

**Solutions:**
1. Start Docker Desktop
2. On Linux, ensure Docker service is running:
   ```bash
   sudo systemctl start docker
   ```
3. Check Docker socket permissions (Linux):
   ```bash
   sudo chmod 666 /var/run/docker.sock
   ```

### Image Pull Failures

**Symptoms:** "Failed to pull image" errors

**Solutions:**
1. Check internet connection
2. Try pulling manually:
   ```bash
   docker pull mcr.microsoft.com/devcontainers/ruby:3.2
   ```
3. Use a different image registry if blocked
4. Check Docker Hub rate limits

---

## Performance Issues

### Slow File Operations

**Symptoms:** Saving files takes a long time, tests run slowly

**Solutions (Mac/Windows):**
1. Use named volumes for dependencies:
   ```yaml
   volumes:
     - .:/workspace:cached
     - bundle_cache:/usr/local/bundle
   ```

2. Add consistency flags to volume mounts:
   - `cached` - Host writes may be delayed to container
   - `delegated` - Container writes may be delayed to host

3. Exclude unnecessary directories with `.dockerignore`

4. Move temp directories to container-local storage:
   ```json
   "mounts": [
     "source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached",
     "target=/workspace/tmp,type=volume"
   ]
   ```

### Slow Bundle Install

**Symptoms:** `bundle install` takes forever

**Solutions:**
1. Use a volume for gems:
   ```yaml
   volumes:
     - bundle_cache:/usr/local/bundle
   ```

2. Add to `.devcontainer/devcontainer.json`:
   ```json
   "mounts": [
     "source=bundle-cache,target=/usr/local/bundle,type=volume"
   ]
   ```

3. Use parallel installation:
   ```bash
   bundle install --jobs 4
   ```

### Container Build is Slow

**Symptoms:** Building container takes many minutes

**Solutions:**
1. Optimize Dockerfile layer caching:
   ```dockerfile
   # Copy dependency files first
   COPY Gemfile Gemfile.lock ./
   RUN bundle install
   
   # Copy application code later
   COPY . .
   ```

2. Use `.dockerignore` to exclude large files:
   ```
   .git
   tmp/
   log/
   node_modules/
   ```

3. Use multi-stage builds for smaller final images

---

## Network and Port Issues

### Port Already in Use

**Symptoms:** "Port 3000 is already allocated" or similar

**Solutions:**
1. Stop the local service using that port
2. Change the port mapping in `devcontainer.json`:
   ```json
   "forwardPorts": [3001]
   ```
3. Or in `docker-compose.yml`:
   ```yaml
   ports:
     - "3001:3000"
   ```

### Cannot Access Application from Browser

**Symptoms:** `localhost:3000` doesn't work

**Solutions:**
1. Check port forwarding in VS Code (bottom panel)
2. Ensure server binds to `0.0.0.0`, not `localhost`:
   ```bash
   rails server -b 0.0.0.0
   ```
3. Check `forwardPorts` in `devcontainer.json`
4. Manually forward port: `F1 → Forward a Port`

### Cannot Connect to Database Service

**Symptoms:** Connection refused to PostgreSQL/Redis/etc.

**Solutions:**
1. Use service name as host (not `localhost`):
   ```ruby
   # Use 'db' not 'localhost'
   PG.connect(host: 'db', ...)
   ```

2. Check service is running:
   ```bash
   docker-compose ps
   ```

3. Check `depends_on` in docker-compose.yml
4. Wait for service to be ready (add healthcheck)

---

## File System Issues

### File Changes Not Detected

**Symptoms:** Auto-reload doesn't work, changes don't appear

**Solutions:**
1. For Mac/Windows, use file system events:
   ```json
   "mounts": [
     "source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached"
   ]
   ```

2. Restart the development server
3. Use polling instead of file events (slower):
   ```ruby
   # Rails config
   config.file_watcher = ActiveSupport::EventedFileUpdateChecker
   ```

### Permission Denied Errors

**Symptoms:** Cannot write files, permission errors

**Solutions:**
1. Run as non-root user in container:
   ```json
   "remoteUser": "vscode"
   ```

2. Match user IDs (Linux):
   ```dockerfile
   ARG USER_UID=1000
   ARG USER_GID=1000
   RUN groupmod -g $USER_GID vscode \
       && usermod -u $USER_UID -g $USER_GID vscode
   ```

3. Fix ownership after build:
   ```json
   "postCreateCommand": "sudo chown -R vscode /workspace"
   ```

---

## Ruby-Specific Issues

### Gem Installation Fails

**Symptoms:** Native extension build failures

**Solutions:**
1. Install build dependencies:
   ```dockerfile
   RUN apt-get update && apt-get install -y \
       build-essential \
       libpq-dev \
       libssl-dev
   ```

2. For specific gems:
   - `pg` needs `libpq-dev`
   - `nokogiri` needs `libxml2-dev libxslt1-dev`
   - `mysql2` needs `libmariadb-dev`

### Wrong Ruby Version

**Symptoms:** Ruby version doesn't match expectation

**Solutions:**
1. Check base image version:
   ```json
   "image": "mcr.microsoft.com/devcontainers/ruby:3.2"
   ```

2. Use specific version tag:
   ```dockerfile
   FROM ruby:3.2.2
   ```

3. Verify in terminal:
   ```bash
   ruby --version
   ```

### Bundler Version Conflicts

**Symptoms:** "Bundler version mismatch" errors

**Solutions:**
1. Install specific bundler version:
   ```bash
   gem install bundler -v '2.4.0'
   ```

2. Update Gemfile.lock:
   ```bash
   bundle update --bundler
   ```

3. Set in Gemfile:
   ```ruby
   gem 'bundler', '~> 2.4'
   ```

---

## VS Code Issues

### Extensions Not Working

**Symptoms:** Ruby language features don't work

**Solutions:**
1. Ensure extensions are installed in container:
   ```json
   "customizations": {
     "vscode": {
       "extensions": [
         "rebornix.ruby",
         "castwide.solargraph"
       ]
     }
   }
   ```

2. Rebuild container after adding extensions
3. Check extension requirements (some need gems)

### Solargraph Not Working

**Symptoms:** No autocomplete, no go-to-definition

**Solutions:**
1. Add solargraph gem:
   ```ruby
   gem 'solargraph', group: :development
   ```

2. Run bundle install
3. Restart VS Code window
4. Check Solargraph status bar

### Terminal Not Opening

**Symptoms:** Integrated terminal won't open or immediately closes

**Solutions:**
1. Check container is running
2. Rebuild container
3. Check shell configuration in devcontainer.json:
   ```json
   "settings": {
     "terminal.integrated.defaultProfile.linux": "bash"
   }
   ```

---

## Docker Desktop Issues

### Docker Desktop Won't Start

**Symptoms:** Docker Desktop stuck on "Starting..."

**Solutions:**
1. Restart Docker Desktop
2. Check system resources (RAM, disk space)
3. Reset Docker Desktop to factory defaults
4. Update Docker Desktop to latest version

### Out of Disk Space

**Symptoms:** "No space left on device" errors

**Solutions:**
1. Prune unused containers:
   ```bash
   docker system prune -a
   ```

2. Remove old images:
   ```bash
   docker image prune -a
   ```

3. Remove volumes:
   ```bash
   docker volume prune
   ```

4. Increase Docker Desktop disk allocation

### WSL 2 Issues (Windows)

**Symptoms:** Various Windows-specific errors

**Solutions:**
1. Update WSL 2:
   ```powershell
   wsl --update
   ```

2. Set WSL 2 as default:
   ```powershell
   wsl --set-default-version 2
   ```

3. Ensure Docker Desktop is using WSL 2 backend

---

## Getting More Help

If you're still stuck:

1. Check the [VS Code DevContainers docs](https://code.visualstudio.com/docs/devcontainers/containers)
2. Review [Docker documentation](https://docs.docker.com/)
3. Search [Stack Overflow](https://stackoverflow.com/questions/tagged/docker)
4. Open an issue on [this repository](https://github.com/mattscilipoti/developing_with_ruby_in_docker/issues)

### Useful Diagnostic Commands

```bash
# Check Docker version
docker --version

# Check running containers
docker ps

# Check all containers
docker ps -a

# View container logs
docker logs <container-name>

# Inspect container
docker inspect <container-name>

# Check Docker system info
docker system info

# Check disk usage
docker system df
```
