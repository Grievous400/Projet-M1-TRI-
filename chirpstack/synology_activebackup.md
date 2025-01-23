## Prélude
Pour éviter d'utiliser une adresse IP pour le serveur, on peut lui attribuer un nom de domaine via le fichier "/etc/hosts" présent dans le Synology.
```
10.8.0.1  chirpstack.server
```

# Configuration d'Active Backup sur Synology
Une fois Active Backup d'installé sur un NAS Synology, cliquer sur <ins>Serveur de fichiers</ins> puis <ins>Ajouter un serveur</ins>.
![image](https://github.com/user-attachments/assets/9ce729a9-1982-4137-a337-723c8c33a73e)

Selectionner <ins>Serveur rsync</ins> comme type de serveur.
![image](https://github.com/user-attachments/assets/04156fc7-802b-4e0b-9758-0bfe42df714a)

Remplisser les différentes cases nécessaires au bon fonctionnement comme <ins>Adresse du serveur</ins>, <ins>Compte</ins> et <ins> Mot de passe</ins>.
![image](https://github.com/user-attachments/assets/71e818b4-29a7-45e0-9854-f9f07d7c7195)

Puis selectionner <ins>Oui</ins> pour lancer la création de tâches.
![image](https://github.com/user-attachments/assets/fda6f680-f02a-42e3-990f-236202a8ddf8)

Choisir <ins>Multi-version</ins> pour le choix du mode de sauvegarde.
![image](https://github.com/user-attachments/assets/cec8a541-e734-4998-b402-1e6a5edab4c0)

Puis choisir le dossier <ins>sauvegardes</ins> ou se situe les 'dump' des bases de données à récuperer.
![image](https://github.com/user-attachments/assets/b1ab10b5-de39-4e84-9fd0-d955111c7fcc)

Choisir un <ins>nom</ins> pour la tâche, un <ins>Chemin local</ins> et cliquer sur <ins>Activer le calendrier</ins>.
![image](https://github.com/user-attachments/assets/42a1db76-bdbe-4c00-a057-de10c2239b84)

Ensuite <ins>Activer la politique de conservation</ins> et cliquer sur <ins>Politique de conservation avancée</ins> puis <ins>Définir les règles</ins>.
![image](https://github.com/user-attachments/assets/c66b6d18-e132-43f0-8ae3-9652b0f627c1)

Puis ne garder que les paramètres présent sur l'image ci-dessous.
![image](https://github.com/user-attachments/assets/27b42e05-c595-4151-9602-ab6ef1f75910)

Enfin cliquer sur <ins>Effectué</ins> pour lancer l'automatisation de la tâche.
![image](https://github.com/user-attachments/assets/fe84cb6e-7e24-4176-9a17-074fb79fda19)

Il reste plus qu'à valider la sauvegarde en cliquant sur <ins>Oui</ins> et la tâche se lancera à l'heure définie précédemment.
![image](https://github.com/user-attachments/assets/3d30a00b-6097-4833-9109-c0d28fe2c985)

On doit s'aperçevoir du bon fonctionnement avec la validation de la première sauvegarde.
![image](https://github.com/user-attachments/assets/0cf408ef-bd74-4e07-9c67-6243a811dff3)
![image](https://github.com/user-attachments/assets/a76b96dc-64e6-4c1f-bd88-2a42e29afefc)

