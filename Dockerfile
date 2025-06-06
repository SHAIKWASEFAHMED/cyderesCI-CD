# Use the official NGINX image
FROM nginx:latest

# Copy custom index.html to NGINX's default directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
