#!/bin/bash

# Crée les répertoires redisdata et postgresqldata
mkdir -p redisdata postgresqldata

# Vérification de la présence du fichier dump.sql (PostgreSQL)
if [ -f "sauvegardes2/dump.sql" ]; then
    # Lance le Docker Compose uniquement pour le service postgres
    docker compose up postgres -d --wait
    sleep 5
    # Restaure la base de données PostgreSQL depuis le dump.sql
    docker compose exec -T postgres psql -h localhost -U postgres < "sauvegardes2/dump.sql"
    # Arrête le Docker Compose
    docker compose down
    # Relance le Docker Compose avec tout les services
    docker compose up -d
else
    echo "Erreur : Le fichier dump.sql n'existe pas."
    exit 1
fi
