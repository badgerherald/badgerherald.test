<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/* The name of the database for WordPress */
define('DB_NAME', 'badgerherald');

/* MySQL database username */
define('DB_USER', 'root');

/* MySQL database password */
define('DB_PASSWORD', 'root');

/* MySQL hostname */
define('DB_HOST', 'localhost');

/* Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/* The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/* badgerherald.test use constants */
define('HRLD_DEV', true);
define('EXA_DEV', true);
define('HRLD_PRODUCTION', false);

/* url definitions */
define('WP_HOME', 'http://badgerherald.test/');
define('WP_SITEURL', 'http://badgerherald.test/wordpress/');
define('EXA_REST_URL', 'http://badgerherald.test/wp-json');
define('EXA_APP_URL', 'http://badgerherald.test/app');


/*#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'nrd>>G2R xK6)&L^bP-6|oleh9Qat(fn0q[Akg)EB AJtF[w?P)j8<$rhUH/6e_(');
define('SECURE_AUTH_KEY',  ';LBk%c+V/O%nZ7:YpXZ3#}tIGN_H18$;Y?:Jn/nl]|4Vj~hRonJ%<No2gISb2dXD');
define('LOGGED_IN_KEY',    'CMQW>%41;%uP+T*[vWBaojb=}NJC!c#9/|]!7&f%xZsmTi/lB7-^#*fQ^TyvK8pM');
define('NONCE_KEY',        '+t9JRNj1+NiAb39Jy1O9^3d_RL_L&8I3C/?SNdqy6$|w[41|nFa+rD==@QI{fd.:');
define('AUTH_SALT',        'v:>(+S);_cAFGT-*`r8b>rHlFby:@{20><C#zI]Akr?P2`{ie{4XFZ:q-0ix8D?n');
define('SECURE_AUTH_SALT', 'P,32Uj? (LAu:tcY#Bq:kQgXcZ[:4N<lPM,MQO+X?$afLOw5KEZiKF+. (,BMlNI');
define('LOGGED_IN_SALT',   'D9[ALHEcb`?g:2q,agTB)>3S`+[n9f4f;JtsAp0xyml8G8LM6}ByK/h2ExypFRhu');
define('NONCE_SALT',       'J_bqEOfxafaNpTD:&AX3RQ0Gjd_?#~4j6?LL=Z O_5q|D|2[=e2>i!FSU%. :FWD');

/*#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
