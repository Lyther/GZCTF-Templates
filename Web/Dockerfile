FROM httpd:2.4
COPY ./utils/ /usr/local/apache2/htdocs/
EXPOSE 80
ENTRYPOINT ["/init-scripts/start.sh"]