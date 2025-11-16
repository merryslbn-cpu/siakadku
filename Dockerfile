# Use PHP 8.2 image with extensions
FROM richarvey/nginx-php-fpm:latest

# Set the working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Install composer dependencies
RUN apk add --no-cache composer
RUN composer install --no-dev --optimize-autoloader

# Set permissions
RUN chown -R nginx:nginx /var/www/html/storage
RUN chown -R nginx:nginx /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage
RUN chmod -R 775 /var/www/html/bootstrap/cache

# Expose port
EXPOSE 80

CMD ["php-fpm"]
