
# Projet WordPress avec Reverse Proxy Traefik

Ce projet permet de déployer deux sites WordPress avec une base de données MySQL, derrière un reverse proxy Traefik configuré pour gérer les certificats SSL et les règles de routage.

## Contenu du Projet

Le fichier `docker-compose.yml` contient la configuration suivante : 
- **MySQL** : Une base de données utilisée par les deux instances WordPress.
- **WordPress** : Deux sites WordPress configurés pour utiliser des bases de données distinctes.
- **Traefik** : Un reverse proxy pour gérer le routage et les certificats SSL.

## Services Déployés

### 1. Base de Données (MySQL)
Le service `db` utilise l'image officielle de MySQL (version 8.0). Il est configuré avec :
- Un mot de passe root spécifié via la variable d'environnement `MYSQL_ROOT_PASSWORD`. ***Mettre les variables d'environnement dans un fichier à part .venv***
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

Les deux services WordPress attendent que la base de données MySQL soit prête grâce à la configuration `WAIT_HOSTS`.

**Expliquer précisément le rôle des lignes** 

```
labels:
      - "traefik.http.routers.wordpress1.rule=Host('claudel-tri.usmb-tri.fr')"
      - "traefik.http.services.wordpress1.loadbalancer.server.port=80"
      - "traefik.http.routers.wordpress1.entrypoints=web,websecure"
      - "traefik.http.routers.wordpress1.tls.certresolver=myresolver"

traefik.http.routers.wordpress1.rule=Host('claudel-tri.usmb-tri.fr') 
Spécifie que le service wordpress1 répond aux requêtes pour le domaine claudel-tri.usmb-tri.fr.

traefik.http.services.wordpress1.loadbalancer.server.port=80 
Indique que Traefik doit rediriger le trafic vers le port interne 80 du conteneur.

traefik.http.routers.wordpress1.entrypoints=web,websecure 
Active l'accès au service via HTTP (port 80) et HTTPS (port 443).

traefik.http.routers.wordpress1.tls.certresolver=myresolver :
Configure le résolveur myresolver pour obtenir un certificat HTTPS via Let's Encrypt.

**Mettre une version du fichier docker-compose.yml sans certificat Let's Encryp et une avec certificat let's encrypt.**

**Donner à chaque fois des commandes de tests et les résultats obtenus.**



**On peut vérifier la présence de nos certificats de la manière suivante**
Pour voir si nos certificats sont bien généré, on peut aller voir les certificats directement depuis notre navigateurs avec l'adresse en https https://claudel-tri.usmb-tri.fr/ 

Dans notre cas, le certificat apparait non valide car il n'est pas signé. Cela vient du fait qu'on utilise le staging server. Nous pouvons voir les différents éléments de notre certificat.
![image](https://github.com/user-attachments/assets/22aed5f8-97ea-4bcd-8664-44e95cf1ab9f)

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

**Tout est dans un seul fichier ??? Donner sa structure et expliquer rapidement son contenu**

Le contenu du fichier acme.json est les informations sur notre resolvers, la clé privé et les certificats chacun suivis de sa clé publique.  


#### Mode de Test (Staging)
Pour éviter de dépasser les limites de requêtes de Let's Encrypt pendant les tests, le serveur de staging est utilisé :

**`--certificatesresolvers.myresolver.acme.caServer=https://acme-staging-v02.api.letsencrypt.org/directory`**

**Quel est le nombre de requêtes max ??? Est-ce que l'utilisation de staging est ok en prod ?** 

Il ne faut pas utiliser l'adresse du serveur de staging en production car ce sont des certificats non-signé. Pour une infrasturcture de production, il faut utiliser cette adresse : https://acme-v02.api.letsencrypt.org/directory
Le nombre de requêtes max dépend du type de certificat demandé. Pour plus d'information, il faut regardé sur la doc officielle https://letsencrypt.org/docs/rate-limits/. 

### Volumes
- `db_data` : Stockage persistant des données MySQL.
- `./letsencrypt` : Stockage des certificats Let's Encrypt.
- `/var/run/docker.sock` : Permet à Traefik de surveiller les événements Docker.

