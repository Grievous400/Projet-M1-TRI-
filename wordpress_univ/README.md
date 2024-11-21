# Mise en place d'un reverse proxy, d'une base de données et deux wordpress

## Généralités

|**Fichiers**|*Fonctionnalités*|
|-----:|:-----|
|*compose_http.yaml*|Docker Compose pour le Reverse Proxy, DB & Wordpress (Version HTTP:80)|
|*compose_https.yaml*|Docker Compose pour le Reverse Proxy, LetsEncrypt, DB & Wordpress (Version HTTP:80 et HTTPS:443)|

|**Commandes**|*Actions*|
|-----:|:-----|
|*docker compose up -d*|pour lancer le compose|
|*docker compose down -v*|pour arrêter le compose|
|*docker compose logs -f*|pour suivre les logs du compose|

## Actions à faire

Pour pouvoir utiliser le docker compose avec une sauvegarde d'un site web, il faut procéder à différents modifications sur certains fichiers.

|**Fichiers**|*Modifications*|
|-----:|:-----|
|*./backup.sql*|Remplacement valeur *user_pass* et *user_activationkey* par ' ' dans wp_users|
|*./backup.sql*|Remplacement *scem-tri.univ-smb* par *durand-tri.usmb-tri* dans wp_options, wp_postmeta, wp_posts et wp_yoast|
|*./wordpress/.htaccess*|Remplacement de */var/www/tri/public_html/wp-content/uploads* par */var/www/uploads*|
|*./wordpress/wp-config.php*|Remplacement valeur *DB_USER* par *${DB_USER}*|
|*./wordpress/wp-config.php*|Remplacement valeur *DB_PASSWORD* par *${DB_PASSWORD}*|
|*./wordpress/wp-config.php*|Remplacement valeur *DB_HOST* par *db:3306*|
|*./wordpress/wp-config.php*|Remplacement valeur *WP_DEBUG* par *true*|

## Testing

*1* - Création d'un dossier de travail et puis à l'intérieur, création des dossiers **sql** et **wordpress**

*2* - Faire les modifications dans les différents fichiers définis dans la partie précédente

*3* - Importer dans le dossier **sql** le fichier **backup.sql**, puis dans le dossier **wordpress**, les fichier **.htaccess**, **wp-config.php** et enfin le dossier **/wp-content** 

*4* - Lancer le docker compose avec la commande : **docker compose up -d**

*4 bis* - Par moment, le site se lance avant la base de données malgré la dépendance dans le docker compose donc faire les commandes suivantes : **docker compose down && docker compose up -d**

*5* - Faire une commande curl sur le wordpress 1 par exemple : **curl ${WORDPRESS1_HOST}**
