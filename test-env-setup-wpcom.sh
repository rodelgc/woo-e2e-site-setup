#!/usr/bin/env bash

echo -e "Installing plugins from .wp-env.json\n"
wp plugin install --activate https://downloads.wordpress.org/plugin/akismet.zip \
    https://github.com/WP-API/Basic-Auth/archive/master.zip \
    https://downloads.wordpress.org/plugin/wp-mail-logging.zip

echo -e "Set default theme\n"
wp theme install --activate twentytwentythree

echo -e "Update URL structure\n"
wp rewrite structure '/%postname%/' --hard

echo -e "Installing mu plugins\n"
# TODO

echo -e 'Add Customer user \n'
wp user create customer customer@woocommercecoree2etestsuite.com \
    --user_pass=password \
    --role=customer \
    --first_name='Jane' \
    --last_name='Smith' \
    --display_name='Jane Smith'

echo -e 'Update Blog Name \n'
wp option update blogname 'WooCommerce Core E2E Test Suite'

echo -e 'Enable tracking\n'
wp option update woocommerce_allow_tracking 'yes'

echo -e 'Upload test images \n'
#  TODO
