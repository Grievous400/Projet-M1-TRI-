#!/bin/bash

# Crée les répertoires redisdata et postgresqldata
mkdir -p redisdata postgresqldata

# Copie le fichier dump.rdb (Redis) dans son répertoire
if [ -f dump.rdb ]; then
    cp dump.rdb redisdata/
    echo "Fichier dump.rdb copié dans le dossier redisdata."
else
    echo "Erreur : Le fichier dump.rdb n'existe pas."
    exit 1
fi

# Vérification de la présence du fichier dump.sql (PostgreSQL)
if [ -f dump.sql ]; then
    # Lance le Docker Compose uniquement pour le service postgres
    docker compose up postgres -d --wait
    sleep 5
    # Restaure la base de données PostgreSQL depuis le dump.sql
    docker compose exec -T postgres psql -h localhost -U postgres < dump.sql
    # Arrête le Docker Compose
    docker compose down
    # Relance le Docker Compose avec tout les services
    docker compose up -d
else
    echo "Erreur : Le fichier dump.sql n'existe pas."
    exit 1
fi
