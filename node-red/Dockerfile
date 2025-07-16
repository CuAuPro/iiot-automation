# Use Node.js 16.13.0 base image
FROM node:16.13.0

# Set working directory
WORKDIR /usr/src/node-red

# Copy your package.json
COPY package.json ./

# Install Node-RED 3.1.15 only
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy flows and scripts
COPY ./scripts /usr/scripts
RUN chmod +x /usr/scripts/*

# Create data directory and fix permissions
RUN mkdir -p /data && chown -R node:node /data

# Copy custom entrypoint
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# Expose default Node-RED port
EXPOSE 1880

# Healthcheck (optional)
HEALTHCHECK CMD curl --fail http://localhost:1880/ || exit 1

# Run as non-root user
USER node

# Start Node-RED
ENTRYPOINT ["./entrypoint.sh"]
