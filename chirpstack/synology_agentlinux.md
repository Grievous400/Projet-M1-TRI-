# Configuration de l'Agent Active Backup sur Linux

<ins>Commandes a executer en sudo</ins>
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

Une fois que l'Agent est "**Successfully connected**", il est automatiquement ajouté dans l'onglet "Serveur physique".
![image](https://github.com/user-attachments/assets/2059ef92-01aa-4251-a442-6ee6fa544174)

Une tâche est automatiquement crée aussi, après il est possible d'en créer une autre ou de modifier celle déjà présente.
![image](https://github.com/user-attachments/assets/24207188-9604-4af7-965d-063b6e30c811)
