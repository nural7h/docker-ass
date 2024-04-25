# Use an official Node.js runtime as the base image
FROM node:alpine

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to run the React app
CMD ["npm", "start"]
