FROM graphiteapp/graphite-statsd


COPY package*.json ./
RUN npm install

COPY index.js /index.js
# Copy the custom entrypoint script into the container
COPY entrypoint /entrypoint

# Make the custom entrypoint script executable
RUN chmod +x /entrypoint
