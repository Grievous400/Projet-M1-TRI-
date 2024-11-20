
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

## 3.Configuration de Traefik et des Certificats HTTPS

### Fonctionnement de Traefik
Traefik est un reverse proxy qui gère automatiquement :
- Le routage des requêtes vers les services (par exemple, WordPress).
- La gestion des certificats SSL/TLS pour sécuriser les connexions HTTPS grâce à Let's Encrypt.

Dans ce projet, Traefik est configuré pour :
- Écouter sur les ports 80 (HTTP) et 443 (HTTPS). Si le port 443 est fermé, on n'obtient pas de certificat Let's Encrypt. 
- Gérer deux domaines distincts : `claudel-tri.usmb-tri.fr` et `durand-tri.usmb-tri.f`.
- Obtenir automatiquement des certificats SSL/TLS via Let's Encrypt.

### Configuration des Certificats SSL/TLS
#### Résolveur de Certificat
Le résolveur `myresolver` est utilisé pour obtenir les certificats auprès de Let's Encrypt. Il est configuré dans les options suivantes :
- **`tlschallenge=true`** : Utilise le challenge TLS-ALPN pour valider les domaines.
- **`email`** : Adresse e-mail utilisée pour enregistrer les certificats.
- **`storage`** : Les certificats et clés sont stockés dans le fichier `acme.json`, situé dans le dossier `letsencrypt`.

#### Mode de Test (Staging)
Pour éviter de dépasser les limites de requêtes de Let's Encrypt pendant les tests, le serveur de staging est utilisé :

**`--certificatesresolvers.myresolver.acme.caServer=https://acme-staging-v02.api.letsencrypt.org/directory`**

### Volumes
- `db_data` : Stockage persistant des données MySQL.
- `./letsencrypt` : Stockage des certificats Let's Encrypt.
- `/var/run/docker.sock` : Permet à Traefik de surveiller les événements Docker.

