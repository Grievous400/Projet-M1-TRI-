#!/bin/bash

# Copier le fichier dump.rdb de Redis
if [ -f redisdata/dump.rdb ]; then
    cp redisdata/dump.rdb dump.rdb
    echo "Fichier dump.rdb copié dans le dossier actuel."
else
    echo "Erreur : Le fichier dump.rdb n'existe pas."
    exit 1
fi

# Récuperation de la base de données PostgreSQL vers dump.sql
sudo docker exec -it chirpstack-postgres-1 pg_dumpall -c --no-password -h localhost -U postgres > dump.sql
echo "Fichier dump.sql copié dans le dossier actuel."
