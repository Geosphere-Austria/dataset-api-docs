FROM FROM vcharbor.zamg.ac.at/cache-dockerhub/library/httpd:2.4-alpine

COPY ./build/ /usr/local/apache2/htdocs/v1/docs