# Nginx ('nginx')

**Part of the BAS Ansible Role Collection (BARC)**

Installs Nginx web-sever using default virtual host

## Overview

* Installs Nginx server.
* Configures default virtual host for HTTP connections, if a non-default document root is used the virtual server will be configured to point to this location.
* Optionally configures virtual host for HTTPS connections, if a non-default document root is used the virtual host will be configured to point to this location.
* The app user is made a member of the `www-data` group and ownership of the default document root is set to the 'app' user.

## Author

[British Antarctic Survey](http://www.antarctica.ac.uk) - Web & Applications Team

Contact: [basweb@bas.ac.uk](mailto:basweb@bas.ac.uk).

## Availability

This role is designed for internal use but if useful can be shared publicly.

## License

[Open Government Licence V2](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/)

## Requirements

### BAS Ansible Role Collection (BARC)

* `core`

### Other

If using SSL the certificate and private key used must be accessible on the server, then use the `nginx_default_var_www_ssl_cert` and `nginx_default_var_www_ssl_key` variables to point to this location. It is out of scope to do this in this role (as the certificate may be used in multiple web-servers).

## Variables

Variables used in default virtual host `/etc/nginx/sites-available/default`:

* `nginx_app_user_username`
    * The username of the app user, used for day to day tasks, if enabled
    * This variable **must** be a valid unix username
    * Default: "app"
* `nginx_default_var_www_document_root`
	* Location on server containing site files. 
	* If a non-default root is used ensure the `www-data` group has access.
    * Default: "/var/www/"
* `nginx_default_var_www_ssl_enabled`
    * Boolean value for enabling SSL support 
    * Default: "false"
* `nginx_default_var_www_ssl_cert_path`
    * Path, without a trailing slash, to the directory holding the SSL certificate 
    * Default: "/vagrant/data/certificates"
* `nginx_default_var_www_ssl_key_path`
    * Path, without a trailing slash, to the directory holding the SSL private key 
    * Default: "{{ nginx_default_var_www_ssl_cert_path }}" (i.e. same directory as `nginx_default_var_www_ssl_cert_path`)
* `nginx_default_var_www_ssl_cert_file`
    * File name (including extension) of SSL certificate in `nginx_default_var_www_ssl_cert_path`
    * Default: "cert.cer"
* `nginx_default_var_www_ssl_key_file`
    * File name (including extension) of SSL private key in `nginx_default_var_www_ssl_key_path`
    * Default: "cert.key"

## Changelog

### 0.2.2 - October 2014

* Updating dependencies
* App user is now configurable using a variable

### 0.2.1 - October 2014

* Adjusting role for inclusion in BARC
* Tasks cleanup

### 0.2.0 - July 2014

* Adding SSL support

### 0.1.0 - July 2014

* Initial version
