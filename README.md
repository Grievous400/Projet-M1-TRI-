
# Projet WordPress avec Reverse Proxy Traefik

Ce projet permet de déployer deux sites WordPress avec une base de données MySQL, derrière un reverse proxy Traefik configuré pour gérer les certificats SSL et les règles de routage.

## Contenu du Projet

Le fichier `docker.yml` contient la configuration suivante :
- **MySQL** : Une base de données utilisée par les deux instances WordPress.
- **WordPress** : Deux sites WordPress configurés pour utiliser des bases de données distinctes.
- **Traefik** : Un reverse proxy pour gérer le routage et les certificats SSL.

## Services Déployés

### 1. Base de Données (MySQL)
Le service `db` utilise l'image officielle de MySQL (version 8.0). Il est configuré avec :
- Un mot de passe root spécifié via la variable d'environnement `MYSQL_ROOT_PASSWORD`.
- Deux volumes :
  - `db_data` : Stocke les données persistantes de la base.
  - `init.sql` : Script d'initialisation pour la base de données, copié automatiquement lors du démarrage.

### 2. Instances WordPress
#### `wordpress1`
- Utilise une base de données MySQL nommée `wordpress`.
- Accessible via le domaine `claudel-tri.usmb-tri.fr`.
- Port mappé : `8080` (local) vers `80` (conteneur).

#### `wordpress2`
- Utilise une base de données MySQL nommée `wordpress2`.
- Accessible via le domaine `scem-eset.usmb-tri.fr`.
- Port mappé : `8081` (local) vers `80` (conteneur).

Les deux services WordPress attendent que la base de données MySQL soit prête grâce à la configuration `WAIT_HOSTS`.

### 3. Reverse Proxy (Traefik)
Le reverse proxy gère :
- Le routage HTTP/HTTPS pour les deux instances WordPress.
- Les certificats SSL via Let's Encrypt (en mode `staging` pour éviter les limites de production lors des tests).

Commandes importantes :
- **`--api.insecure=true`** : Active l'interface d'administration de Traefik sur le port `8085`.
- **`--certificatesresolvers.myresolver.acme.*`** : Configure Let's Encrypt pour la génération et la gestion automatique des certificats.

### Volumes
- `db_data` : Stockage persistant des données MySQL.
- `./letsencrypt` : Stockage des certificats Let's Encrypt.
- `/var/run/docker.sock` : Permet à Traefik de surveiller les événements Docker.

## Utilisation

### Pré-requis
- **Docker** et **Docker Compose** installés sur votre machine.
- Les domaines configurés dans un DNS pointant vers l'adresse IP de votre serveur.

### Commandes
1. **Démarrer les services** :
   ```bash
   docker-compose up -d
