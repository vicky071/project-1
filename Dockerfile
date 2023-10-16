# Use an official Apache web server image as the base image
FROM httpd:2.4

# Download and extract the Academic Education template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page1/academic-education.zip /var/www/html/

WORKDIR /var/www/html/

# Install unzip command (required for extracting the template)
RUN apt-get update && apt-get install -y unzip

# Extract the template
RUN unzip academic-education.zip && \
    mv academic-education/* . && \
    rm -rf academic-education.zip academic-education

# Expose port 80 for HTTP
EXPOSE 80 20

# Start the Apache web server
CMD ["httpd-foreground"]
