#!/bin/bash

# Vérifie si le dossier "sauvegardes" existe
if [ ! -d "sauvegardes" ]; then
    # Si le dossier n'existe pas, le créer
    mkdir sauvegardes
    echo "Le dossier 'sauvegardes' a été créé."
else
    # Si le dossier existe déjà, ne rien faire
    echo "Le dossier 'sauvegardes' existe déjà."
fi

# Copie le fichier dump.rdb de Redis
if [ -f redisdata/dump.rdb ]; then
    cp redisdata/dump.rdb sauvegardes/dump.rdb
    echo "Fichier dump.rdb copié dans le dossier actuel."
    #Permet au synology de copier le fichier (par défaut : 600 root)
    chmod 644 sauvegardes/dump.rdb
else
    echo "Erreur : Le fichier dump.rdb n'existe pas."
    exit 1
fi

# Récuperation de la base de données Postgres vers dump.sql
docker exec -it chirpstack-postgres-1 pg_dumpall -c --no-password -h localhost -U postgres > sauvegardes/dump.sql

# Vérification du code de retour de la commande docker
if [ $? -eq 0 ]; then
    echo "Fichier dump.sql copié dans le dossier actuel."
else
    echo "Erreur : le fichier dump.sql n'a pas pu être extrait."
    exit 1
fi
