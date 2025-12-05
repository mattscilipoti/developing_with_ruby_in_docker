# Basic Ruby DevContainer Example

This is a simple example showing the minimal setup for a Ruby development container.

## Structure

```
basic-ruby/
├── .devcontainer/
│   └── devcontainer.json
├── app.rb
├── Gemfile
└── README.md (this file)
```

## Getting Started

1. Install Docker Desktop
2. Install VS Code
3. Install the "Dev Containers" extension in VS Code
4. Open this folder in VS Code
5. When prompted, click "Reopen in Container" (or use Command Palette: F1 → "Dev Containers: Reopen in Container")
6. Wait for the container to build
7. Open the integrated terminal and run:
   ```bash
   ruby app.rb
   ```

## What's Included

- Ruby 3.2
- Bundler
- Basic VS Code Ruby extensions

## Customization

Edit `.devcontainer/devcontainer.json` to:
- Change Ruby version
- Add more VS Code extensions
- Configure port forwarding
- Add post-creation commands
