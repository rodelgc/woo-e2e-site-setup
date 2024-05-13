#!/usr/bin/env bash

clear

echo "--------------------------------------------------------"
echo -e "Installing Basic Auth plugin"
echo "--------------------------------------------------------"
wp plugin install --activate --force https://github.com/WP-API/Basic-Auth/archive/master.zip

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Setting theme"
echo "--------------------------------------------------------"
wp theme install twentytwentyfour
wp theme activate twentytwentyfour

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Update URL structure"
echo "--------------------------------------------------------"
wp rewrite structure '/%postname%/' --hard

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Set country & state to US:CA"
echo "--------------------------------------------------------"
wp option update woocommerce_default_country "US:CA"

printf "\n\n\n"
