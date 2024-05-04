# woo-e2e-site-setup

1. SSH into the test site, and save the path to the `mu-plugins` folder to the `MU_PLUGINS_PATH` variable:
    ```bash
    export MU_PLUGINS_PATH=<path/to/mu-plugins/folder>
    ```
1. Run this command in the site's terminal:
```bash
curl https://raw.githubusercontent.com/rodelgc/woo-e2e-site-setup/trunk/test-env-setup-wpcom.sh | bash
```