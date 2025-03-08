# Use the official Nginx image as the base
FROM nginx:latest

# Copy static website files into the default Nginx directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Set the default command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

