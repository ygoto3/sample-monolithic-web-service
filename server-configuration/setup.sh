#!/bin/sh

mkdir -p external-assets/sysroot/etc/nginx external-assets/sysroot/var/www/html
cp ../web-server/nginx/conf/nginx.conf ./external-assets/sysroot/etc/nginx/nginx.conf
cp -r ../web-client/dist/* ./external-assets/sysroot/var/www/html

