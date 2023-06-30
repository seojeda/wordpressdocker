<?php
define('DB_NAME', 'word');
define('DB_USER', 'admin');
define('DB_PASSWORD', 'Duoc.2023.');
define('DB_HOST', 'cluster-bd-instance-1.curagnbr1nlv.us-east-1.rds.amazonaws.com');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY', 'Duoc.2023');
define('SECURE_AUTH_KEY', 'Duoc.2023');
define('LOGGED_IN_KEY', 'Duoc.2023');
define('NONCE_KEY', 'Duoc.2023');
define('AUTH_SALT', 'Duoc.2023');
define('SECURE_AUTH_SALT', 'Duoc.2023');
define('LOGGED_IN_SALT', 'Duoc.2023');
define('NONCE_SALT', 'Duoc.2023');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__) . '/');
}

require_once(ABSPATH . 'wp-settings.php');
