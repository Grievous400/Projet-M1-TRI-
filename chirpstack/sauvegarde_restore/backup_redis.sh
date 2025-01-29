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

# Copie le fichier dump.rdb de Redis
if [ -f "$SERVER_DIR/redisdata/dump.rdb" ]; then
    cp "$SERVER_DIR/redisdata/dump.rdb" "$SERVER_DIR/sauvegardes2/dump.rdb"
    echo "Fichier dump.rdb copié dans le dossier actuel."
    # Permet au Synology de copier le fichier (par défaut : 600 root)
    chmod 644 "$SERVER_DIR/sauvegardes2/dump.rdb"
else
    echo "Erreur : Le fichier dump.rdb n'existe pas."
    exit 1
fi
