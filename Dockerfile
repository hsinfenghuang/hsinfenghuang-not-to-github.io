# syntax = docker/dockerfile:1

ARG NODE_VERSION=22.17.0
FROM node:${NODE_VERSION}-slim as base

LABEL fly_launch_runtime="NodeJS"
WORKDIR /app

# Build stage
FROM base as build

# Install build tools
RUN apt-get update -qq && \
    apt-get install -y python-is-python3 pkg-config build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy app source
COPY . .

# Build app
RUN yarn run build

# Final image
FROM base

COPY --from=build /app /app

CMD ["yarn", "run", "start"]
