# lighttpd-webpy

## Description
This docker image contains a [lighttpd](http://www.lighttpd.net) web server with [web.py](http://webpy.org). Python access is done
through the FastCGI interface for speed and flexibility.

## Building
```
docker build .
```

## Using the image
The following locations and files should be used to customize the image:
* `/webapp/lighttpd.conf` is Lighttpt configuration file
* Static files are served from `/webapp/static`
* Python program is at `/webapp/bin`. The default entry point is `bin.py` which is mapped to 
  `http://bin/*`
* The default index file is at `/webapp/static/index.html`
* Logs are saved to `/webapp/log/lighttpd`
* Uploads will be saved at `/webapp/uploads`

## License
The image is release under the [GPL v3](http://www.gnu.org/copyleft/gpl.html) license.
