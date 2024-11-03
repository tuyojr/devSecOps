# Use an official Node.js runtime as a parent image
FROM node:14 AS builder

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Bundle app source code
COPY . .

#######################################################################
# Let us further reduce the size of the image.
FROM node:14-alpine

WORKDIR /usr/src/app

# Copy only the necessary files from the builder stage
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app ./

# Expose the application port
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
