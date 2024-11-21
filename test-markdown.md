### 1. Base de Données (MySQL)
Le service `db` utilise l'image officielle de MySQL (version 8.0). Il est configuré avec :
- Un mot de passe root spécifié via la variable d'environnement `MYSQL_ROOT_PASSWORD`. > Mettre les variables d'environnement dans un fichier à part .venv
- Deux volumes :
  - `db_data` : Stocke les données persistantes de la base.
  - `init.sql` : Script d'initialisation pour la base de données, copié automatiquement lors du démarrage.
