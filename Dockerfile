# Stage 1: Build the application
FROM registry.access.redhat.com/ubi8/nodejs-20:1 AS build

USER 1001

# Set the working directory
WORKDIR /app

# Copy application code
COPY --chown=1001:root . .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Stage 2: Serve the application
FROM registry.access.redhat.com/ubi8/nodejs-20-minimal:1

USER 1001

# Set the working directory
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build --chown=1001:root /app/dist ./dist

# Install serve package to serve the static files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["serve", "-s", "dist", '-p', '8080']
