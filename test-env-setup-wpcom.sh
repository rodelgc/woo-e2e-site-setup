#!/usr/bin/env bash

clear

if [[ -z "$MU_PLUGINS_PATH" ]]; then
    echo "MU_PLUGINS_PATH variable was not set."
    exit 1
fi

echo "--------------------------------------------------------"
echo -e "Installing plugins from .wp-env.json"
echo "--------------------------------------------------------"
wp plugin install --activate https://downloads.wordpress.org/plugin/akismet.zip \
    https://github.com/WP-API/Basic-Auth/archive/master.zip \
    https://downloads.wordpress.org/plugin/wp-mail-logging.zip

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Set default theme"
echo "--------------------------------------------------------"
wp theme install --activate twentytwentythree

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Update URL structure"
echo "--------------------------------------------------------"
wp rewrite structure '/%postname%/' --hard

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e "Installing mu plugins"
echo "--------------------------------------------------------"
curl https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/filter-setter.php >"$MU_PLUGINS_PATH/filter-setter.php"
curl https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/process-waiting-actions.php >"$MU_PLUGINS_PATH/process-waiting-actions.php"
curl https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/test-helper-apis.php >"$MU_PLUGINS_PATH/test-helper-apis.php"
curl https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/mu-plugins/wp-cache-flush.php >"$MU_PLUGINS_PATH/wp-cache-flush.php"
echo "Listing currently installed mu-plugins..."
wp plugin list --status=must-use

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Add Customer user'
echo "--------------------------------------------------------"
wp user create customer customer@woocommercecoree2etestsuite.com \
    --user_pass=password \
    --role=customer \
    --first_name='Jane' \
    --last_name='Smith' \
    --display_name='Jane Smith'

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Update Blog Name'
echo "--------------------------------------------------------"
wp option update blogname 'WooCommerce Core E2E Test Suite'

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Enable tracking'
echo "--------------------------------------------------------"
wp option update woocommerce_allow_tracking 'yes'

printf "\n\n\n"

echo "--------------------------------------------------------"
echo -e 'Upload test images'
echo "--------------------------------------------------------"
wp media import https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/images/image-01.png \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/images/image-02.png \
    https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/images/image-03.png
