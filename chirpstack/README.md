# Mise en place d'un serveur ChirpStack

## Généralités

Clone modifié du repo [chirpstack-docker](https://github.com/chirpstack/chirpstack-docker).

## Modifications du repo

Changement des volumes **postgres** et **redis** en bind mount.

## Actions à faire

L'installation du [vpn](https://github.com/Grievous400/Projet-M1-TRI/blob/main/chirpstack/vpn.md) sur le serveur Chirpstack.

Le paramétrage du [Synology](https://github.com/Grievous400/Projet-M1-TRI/blob/main/chirpstack/synology.md) pour mettre en place le VPN et Active Backup.

Les scripts [script_backup](https://github.com/Grievous400/Projet-M1-TRI/blob/main/chirpstack/script_backup.sh) et [script_restore](https://github.com/Grievous400/Projet-M1-TRI/blob/main/chirpstack/script_restore.sh) doivent être lancés en <ins>**sudo**</ins> et dans le dossier du docker compose.

## Problème connu

Depuis l'université, l'antivirus bloque l'affichage des 'Events' ou 'LoRaWan trames'.

Il faut donc penser a désactivé "l'analyse du trafic web" et "l'AMSI" (mise en OFF).
