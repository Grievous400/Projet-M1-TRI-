#!/bin/bash

# Crée les répertoires redisdata et postgresqldata
mkdir -p redisdata postgresqldata

# Copie le fichier dump.rdb (Redis) dans son répertoire
if [ -f "sauvegardes2/dump.rdb" ]; then
    cp "sauvegardes2/dump.rdb" redisdata/
    echo "Fichier dump.rdb copié dans le dossier redisdata."
else
    echo "Erreur : Le fichier dump.rdb n'existe pas."
    exit 1
fi
