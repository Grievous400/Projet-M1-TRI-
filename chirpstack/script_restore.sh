#!/bin/bash

# Créer les répertoires redisdata et postgresqldata
mkdir -p redisdata postgresqldata

# Copier les fichiers dans les répertoires respectifs
if [ -f dump.rdb ]; then
    cp dump.rdb redisdata/
    echo "Fichier dump.rdb copié dans le dossier redisdata."
else
    echo "Erreur : Le fichier dump.rdb n'existe pas."
    exit 1
fi

if [ -f dump.sql ]; then
    # Lancer Docker Compose pour le service postgres
    docker compose up postgres -d --wait
    sleep 5
    # Restaurer la base de données PostgreSQL depuis le fichier de sauvegarde
    docker compose exec -T postgres psql -h localhost -U postgres < dump.sql
    # Arrêter Docker Compose
    docker compose down
    # Relancer Docker Compose en mode détaché
    docker compose up -d
else
    echo "Erreur : Le fichier dump.sql n'existe pas."
    exit 1
fi
