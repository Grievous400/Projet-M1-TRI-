
# Projet WordPress avec Reverse Proxy Traefik

Ce projet permet de déployer deux sites WordPress avec une base de données MySQL, derrière un reverse proxy Traefik configuré pour gérer les certificats SSL et les règles de routage.
# Mise en place d'un reverse proxy, d'une base de données et deux wordpress

## Généralités

|**Fichiers**|*Fonctionnalités*|
|-----:|:-----|
|***compose_http.yaml***|Docker Compose pour le Reverse Proxy, DB & Wordpress (Version HTTP:80)|
|***compose_https.yaml***|Docker Compose pour le Reverse Proxy, LetsEncrypt, DB & Wordpress (Version HTTP:80 et HTTPS:443)|

|**Commandes**|*Actions*|
|-----:|:-----|
|**docker compose up -d**|pour lancer le compose|
|**docker compose down -v**|pour arrêter le compose|
|**docker compose logs -f**|pour suivre les logs du compose|

## Procédure

Pour pouvoir utiliser le docker compose avec une sauvegarde d'un site web, il faut procéder à différents modifications sur certains fichiers.

|**Fichiers**|*Modifications*|
|-----:|:-----|
|***./backup.sql***|Remplacement valeur **user_pass** et **user_activationkey** par **' '** dans **wp_users**|
|***./backup.sql***|Remplacement de **/var/www/tri/public_html/wp-content/uploads** par **/var/www/wp-content/uploads**|
|***./backup.sql***|Remplacement **scem-tri.univ-smb** par **durand-tri.usmb-tri** dans **wp_options**, **wp_postmeta**, **wp_posts** et **wp_yoast**|
|***./wordpress/.htaccess***|Remplacement de **/var/www/tri/public_html/wp-content/uploads** par **/var/www/wp-content/uploads**|
|***./wordpress/wp-config.php***|Remplacement valeur **DB_USER** par **${DB_USER}**|
|***./wordpress/wp-config.php***|Remplacement valeur **DB_PASSWORD** par **${DB_PASSWORD}**|
|***./wordpress/wp-config.php***|Remplacement valeur **DB_HOST** par **db:3306**|
|***./wordpress/wp-config.php***|Remplacement valeur **WP_DEBUG** par **true**|

## Testing

*1* - Création d'un dossier de travail et puis à l'intérieur, création des dossiers ***sql*** et ***wordpress***

*2* - Importer le fichier ***compose.yaml*** dans la version souhaitée (http ou https) et le fichier ***.env*** contenant les variables d'environnement dans le dossier de travail

*3* - Faire les modifications dans les différents fichiers définis dans la partie précédente (**Actions à faire**)

*4* - Importer dans le dossier ***sql*** le fichier ***backup.sql***, puis dans le dossier ***wordpress***, les fichier ***.htaccess***, ***wp-config.php*** et enfin le dossier ***/wp-content*** 

*5* - Lancer le docker compose avec la commande : **docker compose up -d**

*5 bis* - Par moment, le site se lance avant la base de données malgré la dépendance dans le docker compose donc faire les commandes suivantes : **docker compose down && docker compose up -d**

*6* - Faire une commande curl sur le wordpress 1 par exemple : **curl ${WORDPRESS1_HOST}**



## Contenu du Projet

Le fichier `docker-compose.yml` contient la configuration suivante : 
- **MySQL** : Une base de données utilisée par les deux instances WordPress.
- **WordPress** : Deux sites WordPress configurés pour utiliser des bases de données distinctes.
- **Traefik** : Un reverse proxy pour gérer le routage et les certificats SSL.

## Services Déployés

### 1. Base de Données (MySQL)
Le service `db` utilise l'image officielle de MySQL (version 8.0). Il est configuré avec :
- Un mot de passe root spécifié via la variable d'environnement `MYSQL_ROOT_PASSWORD`.
- Deux volumes :
  - `db_data` : Stocke les données persistantes de la base.
  - `init.sql` : Script d'initialisation pour la base de données, copié automatiquement lors du démarrage. Ce scripts crée deux base de donnée et deux utilisateurs admins sur ces bases. Les bases et les utilisateurs sont utilisé par les dockers wordpress. 
  
-- Création de la première base de données et utilisateur
```
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'your_user'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'your_user'@'%';
```
 La première commande sert à créer une database wordpress s'elle n'existe pas dans notre système de base de donnée.
 La deuxième crée un utilisateur your_user qui a un accès total à la base wordpress et peut s'y connecter de partout.
  
```

### 2. Instances WordPress
#### `wordpress1`
- Utilise une base de données MySQL nommée `wordpress`.
- Accessible via le domaine `claudel-tri.usmb-tri.fr`.
- Port mappé : `8080` (local) vers `80` (conteneur).

#### `wordpress2`
- Utilise une base de données MySQL nommée `wordpress2`.
- Accessible via le domaine `scem-eset.usmb-tri.fr`.
- Port mappé : `8081` (local) vers `80` (conteneur).


```
labels:
      - "traefik.http.routers.wordpress1.rule=Host('claudel-tri.usmb-tri.fr')"
      - "traefik.http.services.wordpress1.loadbalancer.server.port=80"
  
traefik.http.routers.wordpress1.rule=Host('claudel-tri.usmb-tri.fr') 
Spécifie que le service wordpress1 répond aux requêtes pour le domaine claudel-tri.usmb-tri.fr.

traefik.http.services.wordpress1.loadbalancer.server.port=80 
Indique que Traefik doit rediriger le trafic vers le port interne 80 du conteneur. Le port 80 de nos conteneur est utilisé par Wordpress.


### 2.Configuration de Traefik 

### Fonctionnement de Traefik
Traefik est un reverse proxy qui gère automatiquement :
- Le routage des requêtes vers les services (par exemple, WordPress).

Dans ce projet, Traefik est configuré pour :
- Écouter sur les ports 80 (HTTP) 
- Gérer deux domaines distincts : `claudel-tri.usmb-tri.fr` et `durand-tri.usmb-tri.f`.



### Volumes
- `db_data` : Stockage persistant des données MySQL.
- `./letsencrypt` : Stockage des certificats Let's Encrypt.
- `/var/run/docker.sock` : Permet à Traefik de surveiller les événements Docker.

