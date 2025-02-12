# Configuration du VPN sur Synology

Une fois le fichier .opvn prêt (voir étape [OpenVPN](https://github.com/Grievous400/Projet-M1-TRI/blob/main/chirpstack/vpn.md)), on vas l'utiliser pour mettre en place la liaison VPN.

Cliquer sur <ins>Panneau de configuration</ins> puis <ins>Réseau</ins>.
![image](https://github.com/user-attachments/assets/a2658724-6ae7-4705-9342-58edab480665)

Puis sur <ins>Interface réseau</ins> puis <ins>Créer</ins> et <ins>Créer un profil VPN</ins>.
![image](https://github.com/user-attachments/assets/92ecae87-bc4e-49a1-8818-57530a9f035c)

Selectionner <ins>OpenVPN (via l'importation d'un fichier .ovpn)</ins>.
![image](https://github.com/user-attachments/assets/ea88249f-37a8-4275-b857-f8cd9f12a0b9)

Remplir les cases <ins>nom du profil</ins>, <ins>nom d'utilisateur</ins> et <ins>mot de passe</ins> (login serveur) et importer le fichier *client.opvn* précédemment crée.
![image](https://github.com/user-attachments/assets/3c342d1c-1c3d-458f-a691-ae414ff3c77e)

Cocher uniquement la case <ins>Reconnecter quand la connexion VPN est perdue</ins> puis cliquer sur <ins>Effectué</ins>.
![image](https://github.com/user-attachments/assets/863f1d5a-e930-44d5-8d9f-54f4acfbb41d)

Revenir dans <ins>Réseau/Interface réseau</ins>, cliquer sur la liaison VPN puis <ins>Connecter</ins>.
![image](https://github.com/user-attachments/assets/4f7e0337-420e-48b4-82f7-db957f4eee92)

Elle doit apparaître comme active avec une adresse IP qui lui est attribuée.
