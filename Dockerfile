# Use the official Red Hat Universal Base Image for Node.js 20
FROM registry.access.redhat.com/ubi9/nodejs-20-minimal:1

USER 1001

# Set the working directory inside the container
WORKDIR /app

# Copy app
COPY --chown=1001:root . .

# Install dependencies
RUN npm install

RUN npm run build

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["npm", "run", "serve"]
