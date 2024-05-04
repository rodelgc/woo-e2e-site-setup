#!/usr/bin/env bash

echo "--------------------------------------------------------"
echo -e "Installing plugins from .wp-env.json"
echo "--------------------------------------------------------"
wp plugin install --activate https://downloads.wordpress.org/plugin/akismet.zip \
    https://github.com/WP-API/Basic-Auth/archive/master.zip \
    https://downloads.wordpress.org/plugin/wp-mail-logging.zip

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Set default theme"
echo "--------------------------------------------------------"
wp theme install --activate twentytwentythree

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Update URL structure"
echo "--------------------------------------------------------"
wp rewrite structure '/%postname%/' --hard

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Installing mu plugins"
echo "--------------------------------------------------------"
wp plugin install --activate https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/filter-setter.zip \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/process-waiting-actions.zip \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/test-helper-apis.zip \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/wp-cache-flush.zip

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Add Customer user'
echo "--------------------------------------------------------"
wp user create customer customer@woocommercecoree2etestsuite.com \
    --user_pass=password \
    --role=customer \
    --first_name='Jane' \
    --last_name='Smith' \
    --display_name='Jane Smith'

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Update Blog Name'
echo "--------------------------------------------------------"
wp option update blogname 'WooCommerce Core E2E Test Suite'

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Enable tracking'
echo "--------------------------------------------------------"
wp option update woocommerce_allow_tracking 'yes'

echo -e "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Upload test images'
echo "--------------------------------------------------------"
wp media import https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/images/image-01.png \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/images/image-02.png \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/images/image-03.png
