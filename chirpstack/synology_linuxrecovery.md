## Prélude
Avant toute chose, il faut déjà disposer du [Synology Recovery Media](https://global.synologydownload.com/download/Utility/ActiveBackupRecoveryMediaCreator/2.7.1-2684/Linux/Synology-Recovery-Media-2684%283234%29.iso?model=DS923%2B&bays=4&dsm_version=7.2.2&build_number=72806) pour pouvoir ensuite l'utiliser sur une machine.

Pour pouvoir utiliser le Synology Recovery Media, nous devons avoir une VM prête à l'emploi.

Pour cela, un mini tutorial a été fait pour montrer la démarche à suivre sur VirtualBox.

Une fois le logiciel installé et lancé, cliquer sur <ins>Nouvelle</ins>.
![image](https://github.com/user-attachments/assets/a5a026af-1028-4785-9899-437235e5f906)

Ensuite, il faut donner un nom à la VM. Choisir en **ISO Image** le fichier précédemment télécharger .iso puis cliquer sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/e5a2fea8-9c75-4e79-a197-bd67244ea47a)

Ne pas hésiter à augmenter la mémoire vive et le processeur pour avoir des ressources similaires à l'ancienne machine puis cliquer sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/ccbf1a1a-b595-46f9-b5e7-fb77b32c1d74)

Pareil pour le disque dur, il faut qu'il soit au minimum de taille similaire à l'ancienne machine puis cliquer sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/85a9ab4a-d196-48ab-854a-34ecec054dc6)

On vérifie que les paramètres sont bons puis cliquer sur <ins>Finish</ins>.
![image](https://github.com/user-attachments/assets/d4879f97-2461-4064-bf6a-40c4932f25b9)

Une fois la machine prête, cliquer sur <ins>Démarrer</ins>. La machine vas booter sur l'image ISO défini précédemment.
![image](https://github.com/user-attachments/assets/c39608b0-f814-47b3-8431-f66442bf169d)

# Configuration du Synology Recovery Media

Une fois la machine booter sur l'image ISO, selectionner <ins>Next</ins>.
![image](https://github.com/user-attachments/assets/400afd4f-8e1a-40a4-bce8-902c1e1b4dc0)

Pour éviter des soucis de clavier (par défaut : qwerty), on sélectionne les <ins>...</ins> en haut à droite de la fenêtre puis <ins>General Settings</ins>.
![image](https://github.com/user-attachments/assets/d27ee3ec-5169-4fe8-b5b4-04bc33e221da)

On en profite pour mettre le clavier en azerty (<ins>French</ins>) et la langue en <ins>Français</ins> puis cliquer sur <ins>confirm</ins>.
![image](https://github.com/user-attachments/assets/e0734374-407b-4c88-aa0c-08abc3bfa4e7)

Ensuite, il faut rentrer le <ins>nom de domaine</ins> (si un serveur DNS est disponible grâce à un DHCP ou manuellement dans l'onglet <ins>Internet Settings</ins>) ou l'<ins>adresse IP</ins> de la machine, le <ins>nom d'utilisateur</ins> ainsi que le <ins>mot de passe</ins> puis cliquer sur <ins>Connecter</ins>.
![image](https://github.com/user-attachments/assets/3c8bf3c1-5634-46f4-ac23-198dcd4691a3)

Cliquer sur <ins>Procéder quand même</ins> puis sur <ins>Connecter</ins>.
![image](https://github.com/user-attachments/assets/df455233-45d4-4c10-a4a7-e4c5cb422093)

On selectionne la <ins>périphérique</ins> que l'on souhaite restaurer puis cliquer sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/8c6490ad-62c6-4cf0-bf1c-4b646a51239b)

Ensuite, il faut choisir la restauration voulue. Dans notre cas, la <ins>restauration complète du périphérique</ins> puis cliquer sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/b1738a4c-b9a6-4728-af3d-36aa18579e95)

On selectionne la <ins>version</ins> que l'on souhaite restaurer. Dans mon exemple, il n'existe qu'une version mais sinon on pourrait choisir une date et/ou heure différente. Cliquer ensuite sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/d934a22c-bdb6-4cb8-9442-8c111c968e24)

Le logiciel nous montre les différentes informations pour être sûr de la version à restaurer puis cliquer sur <ins>Suivant</ins>.
![image](https://github.com/user-attachments/assets/94bbb148-4954-4d80-9212-3d3fec985cb4)

Ensuite la restauration commence et une fois les différentes tâches terminées, cliquer sur <ins>Terminer</ins>.
![image](https://github.com/user-attachments/assets/d41f6534-0eb7-4fa9-b5ca-f0a0a2b474d9)

Enfin, le logiciel nous indique que la restauration s'est faite avec succès et qu'on peut ôter le support de restauration et cliquer sur <ins>Redémarrer</ins>.
![image](https://github.com/user-attachments/assets/21da86b4-22b2-43e0-9298-874be32520e8)

Voilà, la restauration est ainsi faite et la machine peut revenir à l'état initiale au moment de la sauvegarde.
