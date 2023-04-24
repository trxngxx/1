# Base image
FROM nginx:latest

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL certificate and key
COPY ssl.crt /etc/ssl/certs/
COPY ssl.key /etc/ssl/private/

# Copy web content
COPY html /usr/share/nginx/html

# Expose ports
EXPOSE 80 443
