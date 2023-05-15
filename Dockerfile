# Base image
FROM nginx:latest

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL certificate and key
COPY /home/ngo1/Desktop/cert/server.crt /etc/nginx/
COPY /home/ngo1/Desktop/cert/server.key /etc/nginx/

# Copy web content
COPY html /usr/share/nginx/html/index.html

# Expose ports
EXPOSE 80 443
