# Use the official Red Hat Universal Base Image for Node.js
FROM registry.access.redhat.com/ubi9/nodejs-20:latest

USER 1001

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Use a lightweight server to serve the built application
# You can use any server you prefer, here we use `serve`
RUN npm install -g serve

# Command to run the application
CMD ["serve", "-s", "dist"]
