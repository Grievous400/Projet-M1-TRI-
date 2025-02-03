# Configuration de l'Agent Active Backup sur Linux

<ins>Configuration requise</ins>
```
    Prend en charge les versions de noyau entre 2.6 et 6.8
    Prend en charge les versions 64 bits des distributions Linux suivantes :
        CentOS : 7.8, 7.9, 8.1, 8.5
        RHEL : 6.10, 7.8, 7.9, 8.1, 8.4, 8.5, 8.6, 8.7, 8.8, 8.9, 8.10, 9.0, 9.1, 9.2, 9.3, 9.4
        Ubuntu : 16.04, 18.04, 20.04, 22.04, 24.04
        Fedora : 38, 39, 40
        Debian : 10, 11, 12
    Systèmes de fichiers pris en charge
        ext2
        ext3
        ext4
        XFS
    Composants requis sur l'appareil Linux source
        make version 4.1 ou supérieure
        dkms version 2.2.0.3 ou supérieure
        gcc version 4.8.2 ou supérieure
```

<ins>Commandes a executer en sudo sur la machine Linux</ins>
```
dnf install wget
dnf install unzip
wget https://global.download.synology.com/download/Utility/ActiveBackupBusinessAgent/2.7.0-3221/Linux/x86_64/Synology%20Active%20Backup%20for%20Business%20Agent-2.7.0-3221-x64-rpm.zip
unzip Synology\ Active\ Backup\ for\ Business\ Agent-2.7.0-3221-x64-rpm.zip 
./install.run
```
Puis après quelques minutes, une fois l'installation faite, il est nécessaire de lancer l'Agent.
```
abb-cli -c 
```

Il faut rentrer l'adresse du serveur, le username, le mot de passe et ainsi de suite.
![image](https://github.com/user-attachments/assets/a0adccd7-0dfa-418b-bdb1-4ca34f3b93ca)

Une fois que l'Agent est "**Successfully connected**", il est automatiquement ajouté dans l'onglet "*Serveur physique*".
![image](https://github.com/user-attachments/assets/2059ef92-01aa-4251-a442-6ee6fa544174)

Une tâche est automatiquement crée aussi, après il est possible d'en créer une autre ou de modifier celle déjà présente.
![image](https://github.com/user-attachments/assets/24207188-9604-4af7-965d-063b6e30c811)

## (Optionnel) Commandes disponibles pour l'Agent 

|**Commande**|*Description*|
|-----:|:-----|
|abb-cli -c|Se connecter à Synology NAS.|
|abb-cli -r|Se reconnecter à Synology NAS ou modifier la connexion.|
|abb-cli -l|Se déconnecter de Synology NAS. Vous devez avoir les privilèges des gestionnaires de paquets pour déconnecter l'appareil du serveur.|
|abb-cli -s|Afficher le statut récent du service de sauvegarde et la connexion entre votre appareil et Synology NAS. Le lien vers Portail de récupération sera également disponible.|
|abb-cli -h|Voir les options de contrôle disponibles.|
|abb-cli -v|Vérifier la version actuelle de l'agent.|
|abb-cli -q|Modifier les paramètres de notification pour n'envoyer que des notifications d'invite et d'erreur.|
