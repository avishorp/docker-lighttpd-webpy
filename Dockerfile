# py-web-sever
#
# Mininal Web server, based on lighttpd and web.py
# Static files served from /webapp/static
# URLs in the form /bin/* are redirected to the python script
#   /webapp/py/bin.py

FROM phusion/baseimage:0.9.15
MAINTAINER Avishay Orpaz <avishorp@gmail.com>

RUN apt-get update
RUN apt-get install -y python unzip lighttpd python-flup python-webpy

# Copy the example script to the application directory
ADD webapp /webapp
RUN mkdir -p /webapp/log/lighttpd

# Expose port 80 for the server
EXPOSE 80

# Entry point
CMD ["/sbin/my_init"]

# Add the lighttpd service
RUN mkdir /etc/service/lighttpd
ADD lighttpd.sh /etc/service/lighttpd/run

# Create the www user
RUN adduser --disabled-password --disabled-login --no-create-home www
RUN chown -R www /webapp/log /webapp/uploads

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


