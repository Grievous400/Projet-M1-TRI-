# Mise en place d'un reverse proxy, d'une base de données et deux wordpress

## Généralités

|**Fichiers**|*Fonctionnalités*|
|-----:|:-----|
|compose.yaml|Docker Compose pour le Reverse Proxy, DB & Wordpress|

|**Commandes**|*Actions*|
|-----:|:-----|
|docker compose up -d|pour lancer le compose|
|docker compose down -v|pour arrêter le compose|
|docker compose logs -f|pour suivre les logs du compose|

## Actions à faire

Pour pouvoir utiliser le docker compose avec une sauvegarde d'un site web, il faut procéder à différents modifications sur certains fichiers.

|**Fichiers**|*Modifications*|
|-----:|:-----|
|./backup.sql|Remplacement valeur *user_pass* et *user_activationkey* par ' ' dans wp_users|
|./backup.sql|Remplacement *scem-tri.univ-smb* par *durand-tri.usmb-tri* dans wp_options, wp_postmeta, wp_posts et wp_yoast|
|./wordpress/.htaccess|Remplacement de */var/www/tri/public_html/wp-content/uploads* par */var/www/uploads*|
|./wordpress/wp-config.php|Remplacement valeur *DB_USER* par *root*|
|./wordpress/wp-config.php|Remplacement valeur *DB_PASSWORD* par *rootpassword*|
|./wordpress/wp-config.php|Remplacement valeur *DB_HOST* par *db:3306*|
|./wordpress/wp-config.php|Remplacement valeur *WP_DEBUG* par *true*|
