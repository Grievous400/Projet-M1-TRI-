#!/bin/bash

# Ajoute le chemin complet pour les commandes
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Défini une variable pour le chemin d'acces au serveur
SERVER_DIR="/home/almalinux/thomas/chirpstack"

# Vérifie si le dossier "sauvegardes" existe
if [ ! -d "$SERVER_DIR/sauvegardes2" ]; then
    # Si le dossier n'existe pas, le créer
    mkdir "$SERVER_DIR/sauvegardes2"
    echo "Le dossier 'sauvegardes2' a été créé."
else
    # Si le dossier existe déjà, ne rien faire
    echo "Le dossier 'sauvegardes2' existe déjà."
fi

# Changement de dossier pour celui du docker compose afin d'executer la commande docker
cd /home/almalinux/thomas/chirpstack || exit 1

# Récupération de la base de données Postgres vers dump.sql
/usr/bin/docker exec chirpstack-postgres-1 pg_dumpall -c --no-password -h localhost -U postgres > "$SERVER_DIR/sauvegardes2/dump.sql"

# Vérification du code de retour de la commande docker
if [ $? -eq 0 ]; then
    echo "Fichier dump.sql copié dans le dossier actuel."
else
    echo "Erreur : le fichier dump.sql n'a pas pu être extrait."
    exit 1
fi
