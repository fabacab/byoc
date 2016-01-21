#!/usr/bin/env sh

readonly HOST_USERNAME="$1"
readonly WORDPRESS_DIR="/media/sf_wordpress-vm"

# Make sure we have the necessary PHP extensions.
echo "Installing PHP extensions..."
sudo tazpkg get-install php-curl
sudo tazpkg get-install php-openssl

echo "Downloading WordPress..."
cd "$WORDPRESS_DIR"
wget -q --no-check-certificate https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz && rm latest.tar.gz
mv wordpress/* . && rmdir wordpress
echo "Downloading WordPress plugins..."
cd wp-content/plugins
wget -q --no-check-certificate https://downloads.wordpress.org/plugin/diasposter.0.1.9.zip
wget -q --no-check-certificate https://downloads.wordpress.org/plugin/tumblr-crosspostr.0.8.4.zip
wget -q --no-check-certificate https://downloads.wordpress.org/plugin/wp-crosspost.0.3.3.zip
echo "Installing WordPress plugins..."
for i in *.zip; do
    unzip "$i" && rm -f "$i"
done

echo "Setting up MySQL database..."
# We bounce mysqld because, in Vagrant, synced folders are mounted AFTER system boot.
sudo /etc/init.d/mysql stop
sleep 5 # ensure MySQL stops fully before (re-)starting it. Needed for slow machines.
sudo /etc/init.d/mysql start
sleep 5 # ensure MySQL starts fully before talking to it. (Needed for slow machines?)
mysql -u root --wait --connect-timeout=20 -B -e "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password'" \
    && echo "    created MySQL user 'username'@'localhost' with password 'password'"
mysql -u root -B -e "CREATE DATABASE wordpress" \
    && echo "    created database 'wordpress'"
mysql -u root -B -e "GRANT ALL ON wordpress.* TO 'username'@'localhost'" \
    && echo "    granted privileges to WordPress user"
echo
echo "Configuring WordPress installation..."
HTTP_POST_DATA="dbname=wordpress&uname=username&pwd=password&dbhost=localhost&prefix=wp_&language=&submit=Submit"
wget -qO- 'http://localhost/wordpress/wp-admin/setup-config.php?step=2' --post-data="$HTTP_POST_DATA" > /dev/null \
    && wget -qO- 'http://localhost/wordpress/wp-admin/install.php?language=en_US' > /dev/null
echo "Done!"
echo
echo "============================================================================================"
echo "Visit http://localhost:8080/wordpress in your browser to begin using Bring Your Own Content!"
echo "You will be asked to create a WordPress user account. This will be used to log in to your"
echo "publishing dashboard and allow you to post, edit, and delete entries on your remote blogs."
echo
echo "For simplicity's sake, consider using your local user account name ($HOST_USERNAME) as your"
echo "WordPress user account, too, but you can of course choose whatever log in info you want."
echo
echo "Once logged in, you will need to visit the page below and activate the plugin for whatever"
echo "blog hosting provider(s) you want to publish your posts to:"
echo
echo "    http://localhost:8080/wordpress/wp-admin/plugins.php"
echo
echo "We hope you enjoy using Bring Your Own Content!"
echo "============================================================================================"
