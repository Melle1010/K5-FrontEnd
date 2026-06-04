# Use a lightweight Node.js image for the frontend
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package manifests first for better layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose the static server port
EXPOSE 8080

# Start the app using the existing npm script
CMD ["npm", "run", "serve"]
