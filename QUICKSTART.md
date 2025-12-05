# Quick Start Guide

Get started with Ruby development in Docker using VS Code DevContainers in just a few minutes!

## Prerequisites

Before you begin, ensure you have:

1. **Docker Desktop** - [Download and install](https://www.docker.com/products/docker-desktop)
   - Windows: Docker Desktop for Windows
   - Mac: Docker Desktop for Mac
   - Linux: Docker Engine

2. **Visual Studio Code** - [Download and install](https://code.visualstudio.com/)

3. **Dev Containers Extension** - Install from VS Code:
   - Open VS Code
   - Press `Ctrl+Shift+X` (or `Cmd+Shift+X` on Mac)
   - Search for "Dev Containers"
   - Install the extension by Microsoft

## Quick Start (5 Minutes)

### Option 1: Try Our Example Projects

1. Clone this repository:
   ```bash
   git clone https://github.com/mattscilipoti/developing_with_ruby_in_docker.git
   cd developing_with_ruby_in_docker
   ```

2. Open one of the example projects:
   ```bash
   cd examples/basic-ruby
   code .
   ```

3. When VS Code opens, you'll see a notification. Click **"Reopen in Container"**
   
   Or use the Command Palette:
   - Press `F1` or `Ctrl+Shift+P`
   - Type "Dev Containers: Reopen in Container"
   - Press Enter

4. Wait for the container to build (first time takes 2-3 minutes)

5. Once ready, open the integrated terminal (`Ctrl+``) and run:
   ```bash
   bundle install
   ruby app.rb
   ```

🎉 You're now developing Ruby in a Docker container!

### Option 2: Start Your Own Project

1. Create a new project folder:
   ```bash
   mkdir my-ruby-project
   cd my-ruby-project
   code .
   ```

2. In VS Code, press `F1` and type:
   ```
   Dev Containers: Add Dev Container Configuration Files...
   ```

3. Select "Ruby" from the list

4. Choose Ruby version (e.g., "3.2")

5. Select additional features if needed (or skip)

6. Click "OK" and VS Code will create the `.devcontainer` folder

7. Press `F1` again and select:
   ```
   Dev Containers: Reopen in Container
   ```

8. Create your Ruby files and start coding!

## Common Commands

### Open in Container
```
F1 → Dev Containers: Reopen in Container
```

### Rebuild Container (after config changes)
```
F1 → Dev Containers: Rebuild Container
```

### Exit Container (return to local)
```
F1 → Dev Containers: Reopen Folder Locally
```

### View Container Logs
```
F1 → Dev Containers: Show Container Log
```

## Next Steps

- 📺 [Watch the presentation](https://mattscilipoti.github.io/developing_with_ruby_in_docker/)
- 📁 Explore the [example projects](./examples/)
- 📖 Read the [detailed documentation](./docs/)
- 🔧 Customize your `.devcontainer/devcontainer.json`

## Troubleshooting

### Container won't build
- Check Docker Desktop is running
- Try: `F1 → Dev Containers: Rebuild Container Without Cache`
- View logs: `F1 → Dev Containers: Show Container Log`

### Extensions not working
- Add extension IDs to `.devcontainer/devcontainer.json`:
  ```json
  "customizations": {
    "vscode": {
      "extensions": ["rebornix.ruby", "castwide.solargraph"]
    }
  }
  ```
- Rebuild the container

### Port already in use
- Change the port in your app or in `devcontainer.json`:
  ```json
  "forwardPorts": [3001]
  ```

## Getting Help

- [VS Code DevContainers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Documentation](https://docs.docker.com/)
- [Repository Issues](https://github.com/mattscilipoti/developing_with_ruby_in_docker/issues)
