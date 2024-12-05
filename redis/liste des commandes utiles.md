Redis service de base de donnée NOSQL. C'est un système de clé/valeur. Tous est stocké dans la mémoire vive de la machine.

Commande pour se connecter à redis : 

redis-cli -h adresse_IP_distant -p 6379 -a ton_mot_de_passe

Commande pour configurer la base redis :

Cette commande renvoye toute la configuraton de notre base redis 
config get *

Cette commande sert à configurer les paramètres de la base :

config set paramètre "votre valeur"
