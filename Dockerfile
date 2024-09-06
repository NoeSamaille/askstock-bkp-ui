# Use the official Red Hat Universal Base Image for Node.js 20
FROM registry.access.redhat.com/ubi9/nodejs-20-minimal:1

USER 1001

# Set the working directory inside the container
WORKDIR /app

# Copy app
COPY --chown=1001:root . .

# Install dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 8080

RUN npm install -g serve

# Command to run the application
CMD ["serve", "-s", "dist"]
