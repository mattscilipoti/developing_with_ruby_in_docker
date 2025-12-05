FROM mcr.microsoft.com/devcontainers/ruby:3.2

# Install system dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    libpq-dev \
    redis-tools \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

CMD ["sleep", "infinity"]
