## Historique

### *S6 03 au 09 février*
Modification fichier .ovpn avec le nouveau nom de domaine (preprod2)

Réflexion sur la réutilisation de l'image du disque (sda)

Changement du fichier .img vers .vdi et .vmdk mais erreur ensuite sur l'initialisation de la VM (Linux ne retrouve pas ses volumes logiques)

### *S5 27 au 02 février*
Modification du document de soutenance (suite à la préparation entretien)

Test de l'agent Active Backup sur le serveur (Error car AlmaLinux trop récent)

Test de l'agent Synology sur une machine moins récente (AlmaLinux =< 9.4)

Construction de la documentation pour l'ajout d'une machine avec l'agent Synology Active Backup

### *S4 20 au 26 janvier*
Modification power point présentation (suite mail de Bernard)

Ajout dans le fichier /etc/hosts du Synology "10.8.0.1 chirpstack.server"

Passage du synology en IP fixe (reprenant l'IP attribuée par le serveur DHCP)

Modification des scripts de sauvegarde et de restauration (/var/backup)

Modification endroit de la save (synology active backup)

### *S3 13 au 19 janvier*
Prise de screenshots et construction de la documentation au sujet des différentes tâches éffectués la semaine dernière et aujourd'hui (installation vpn, configuration vpn, configuration active backup, configuration cron)

Modification du script de backup pour qu'il fonctionne avec cron (passage en lien absolu avec variable + ajout variable environnement)

### *S2 06 au 12 janvier*
Installation et configuration du VPN (OpenVPN) sur le serveur Chirpstack

Procédure d'installation du VPN sur GitHub

Test de backup avec SCP, RSYNC
```
sudo rsync -v -e ssh /home/almalinux/thomas/chirpstack/dump.rdb projetm1-24@10.8.0.6:/volume1/chirpstack/Sauvegardes
```

Création compte Synology

Mise en place d'Active Backup for Business sur le Synology en lien avec le serveur Chirpstack

### *S51 16-22 décembre*
Modification Github, merge dans la branche main pour éviter les duplications de partout

Montée en compétences sur Synology NAS, OpenVPN

Mise à jour des documents pour la soutenance orale (classeur hommes/jour et présentation powerpoint)

Modification script et essai complet sur le serveur chirpstack

### *S50 09-15 décembre*
Création d'un script pour récuperer les deux BDD.

Rajout de détails sur les scripts pour afficher un message en cas d'erreur.

Changement du compose en volume bind mount (pour les conteneurs postgres et redis).

Relancement du conteneur dans ces conditions (re-enregistrement de la gateway et des deux capteurs de température) pour pouvoir plus facilement récuperer les backups des BDD.

Création d'un script pour restaurer les deux BDD.

### *S49 02-08 décembre*
Modification Powerpoint Soutenance.

Oral avec M. Flechet.

Prise de notes des modifications à faire sur les documents.

Montée en compétences sur Redis.

Création documents pour la soutenance orale.

Mise à jour du planning avec les hommes/jours.

Création du powerpoint pour la soutenance.

### *S48 25-01 décembre*
Installation du docker compose Chirpstack.

Configuration de la Gateway LoRaWan sur le serveur.

Configuration des 2 capteurs de températures LHT65 sur le serveur.

Problème d'affichages des 'Event' et 'LoRaWan Frames' sur le site web depuis l'université. Il faut mettre sur l'antivirus F-Secure Client l'analyse du trafic web & AMSI en OFF.

Approfondissement du cours LoRaWan.

Récupération des 2 sondes de températures LHT65.

Apprentissage sur le fonctionnement de celles-ci.

Mail envoyé au professeur pour savoir l'adresse IP de la Gateway LoRaWan

### *S47 18-24 novembre*
Commencement du cours sur le LoRaWaN et modifications des dockers compose.

Ajout des versions http et https pour pouvoir utiliser le site sur port 80 et 443 si besoin.

Modification du github avec l'ajout d'un dossier wordpress_univ pour mettre les dockers compose dedans.

Modification des dockers compose avec l'ajout d'un fichier de variable d'environnement .env pour éviter que les mots de passe ne soit divulgés sur le github.

Essais avec différentes versions de Wordpress (version 5.8.3 puis 5.8 et 5.4). Toujours en erreur concernant un module PHP et le plugin fusion-builder.

Pour éviter l'importation de fichiers non compatibles, j'importe complètement le site internet (pas uniquement wp-content) mais cela n'y change rien.

L'erreur indique une version de class-phpmailer.php utilisé qui serait dépréciée depuis la version Wordpress 5.5.0 (hors le site fonctionne avec une version 5.8.6 de WP).

Mail envoyé au professeur pour expliquer le problème. Bascule sur l'apprentissage du Lorawan.

### *S46 11-17 novembre*
Mail envoyé au professeur pour savoir les versions utilisées car j'ai une erreur PHP avec la dernière version de Wordpress (PHP v8).

Utilisation du code fourni par Louis pour avoir un certificat généré par LetsEncrypt.

Réponse du professeur, version utilisé sur le serveur web (WP : 5.8.6 / PHP : 7.4.33).

Problème est qu'il n'existe pas d'image Wordpress concernant la version 5.8.6.

On retrouve les images WordPress avec comme version 5.8.3 puis 5.9. J'utiliserai donc la 5.8.3 (PHPv5.4.27) qui se rapproche le plus du cas d'utilisation du serveur (PHPv5.4.33).

Pendant l'investigation sur les erreurs en cours, j'en apprends plus sur Docker, Wordpress et la base de données.

Dans le cas d'un conteneur, on peut <ins>uniquement</ins> utiliser les fichiers ci-dessous pour la sauvegarde :
```
/wp-content/
   /plugins/         <- Plugins installés
   /themes/          <- Thèmes installés
   /uploads/         <- Médias
/.htaccess           <- Règles spécifiques
/robots.txt          <- Fichier pour les moteurs de recherche
/wp-config.php       <- Configuration personnalisée
```
L'entrypoint du Docker Wordpress regardera ainsi dans le volume et installera <ins>uniquement</ins> les fichiers manquant.

Cela permet un gain de place et évite d'importer toute la configuration du site web.

### *S45 04-10 novembre**
Le site fonctionne mais je comprends vite que cela ne fonctionne pas (l'URL rebascule sur l'ancien site).

En cherchant dans la base de données, je trouve qu'il existe une multitude de références à l'ancienne URL qui vas falloir changer pour le nouveau nom de domaine (wp_options, wp_postmeta, wp_posts et wp_yoast)

Modification des liens dans la base de données vers le nouveau nom de domaine.

A la suite de cela, j'ai des erreurs concernant un plugin fusion-builder (liens avec le thème Avada) qui ne fonctionne pas avec la dernière version de Wordpress (et donc PHP).

Renseignement sur la méthode de chiffrement du mot de passe par Wordpress dans la base de données. 

D'après des recherches, Wordpress n'utilise plus MD5 mais une méthode plus complexe pour inscrire le mot de passe dans la base de données. Du coup, pour l'instant, le mot de passe sera remplacé par ' ' dans un but de test.

Renseignement sur *user_activationkey* qui sert uniquement dans le cas d'un oubli de mot de passe. 

Wordpress génère une clé qui vas insérer à cet emplacement et l'envoyer aussi par mail. Quand l'utilisateur cliquera sur le lien, Wordpress comparera si les deux clés sont les mêmes pour valider (ou non) que c'est bien le bon utilisateur.

Modification sur le *wp-config.php* des différents informations nécessaires.

Modification dans la base de données des informations sur le *wp_users*.

Découvert dans l'entrypoint du conteneur mysql qu'on peut fixer un dump pour qu'il l'importe automatique au démarrage (./backup.sql:/docker-entrypoint-initdb.d/dump.sql:ro)
