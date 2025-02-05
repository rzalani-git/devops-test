FROM graphiteapp/graphite-statsd:1.1.10-5


# Set default environment to DEV if not provided
ARG ENV=DEV
ENV NODE_ENV=${ENV}

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1

# Add a non-root user
RUN addgroup -S appuser && adduser -S appuser -G appuser

# Switch to the new user
USER appuser

COPY package*.json ./
RUN npm install

COPY index.js /index.js
# Copy the custom entrypoint script into the container
COPY entrypoint /entrypoint

# Make the custom entrypoint script executable
RUN chmod +x /entrypoint
