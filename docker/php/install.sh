#!/bin/bash

if ! test -e /usr/share/phpmyadmin/index.php; then
	#change to the location where we are going to download the phpmyadmin tar file
	cd /tmp

	# Download phpMyAdmin
	wget -O phpMyAdmin-5.2.1-all-languages.tar.gz https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz

	# Extract the downloaded archive
	tar xvf phpMyAdmin-5.2.1-all-languages.tar.gz --strip-components=1 -C /usr/share/phpmyadmin

	# Copy the file config.sample.inc.php and rename to config.inc.php
	cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php

	# change some values inside phpmyadmin's config.inc.php
	sed -i "s/\$cfg\['blowfish_secret'\] = '';/\$cfg['blowfish_secret'] = 'e5af82c96c5fc2b66522a751e558b133d79bb4d344d935f7c2b9b6c0595bb8f94';/" /usr/share/phpmyadmin/config.inc.php
	sed -i "s/\(\$cfg\['Servers'\]\[\$i\]\['host'\] = \)'localhost';/\1'mysql';/" /usr/share/phpmyadmin/config.inc.php

	rm phpMyAdmin-5.2.1-all-languages.tar.gz

	cd /var/www/html
fi

# Wait for the file /usr/share/phpmyadmin/index.php to exist
while [ ! -e /usr/share/phpmyadmin/index.php ]; do
    sleep 1  # Sleep for 1 second
done

# Launch php-fpm
php-fpm