FROM httpd:2.4-alpine
COPY ./build/ /usr/local/apache2/htdocs/