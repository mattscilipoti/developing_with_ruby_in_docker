FROM mcr.microsoft.com/devcontainers/ruby:3.2

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    libpq-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install yarn
RUN npm install -g yarn

# Keep container running
CMD ["sleep", "infinity"]
