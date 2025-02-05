FROM graphiteapp/graphite-statsd


# Set default environment to DEV if not provided
ARG ENV=DEV
ENV NODE_ENV=${ENV}

COPY package*.json ./
RUN npm install

COPY index.js /index.js
# Copy the custom entrypoint script into the container
COPY entrypoint /entrypoint

# Make the custom entrypoint script executable
RUN chmod +x /entrypoint
