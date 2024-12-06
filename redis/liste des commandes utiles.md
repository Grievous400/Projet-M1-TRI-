Redis service de base de donnée NOSQL. C'est un système de clé/valeur. Tous est stocké dans la mémoire vive de la machine.

## Commande pour se connecter à redis : 

``` redis-cli -h adresse_IP_distant -p 6379 -a ton_mot_de_passe ```

## Commande pour configurer la base redis :

Cette commande renvoye toute la configuraton de notre base redis :

 ```config get * ```

Cette commande sert à configurer les paramètres de la base :

```config set paramètre "votre valeur"```

## Cette commande sert à sauvegarder l'état de la bdd :

``` save 60 10```

Tous les 60 secondes, si 10 changements ont été détectés, la base de données est sauvegardée.
Pour faire cette action en bachground, on peut utiliser la commande bgsave

## Commande pour ajouter des entrées : 

Cette commande permet de faire une entrée "nom de l'entrée" avec comme valeur "valeur de l'entrée"

``` set "nom de l'entrée" "valeur de l'entrée" ```

``` get "nom de l'entrée" ```

## Pour plus d'information sur le fonctionnement de la base redis :
https://www.ionos.fr/digitalguide/hebergement/aspects-techniques/redis-tutoriel/
