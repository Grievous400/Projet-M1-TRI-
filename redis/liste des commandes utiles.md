Redis service de base de donnée NOSQL. C'est un système de clé/valeur. Tous est stocké dans la mémoire vive de la machine.

## Commande pour se connecter à redis : 

``` redis-cli -h adresse_IP_distant -p 6379 -a ton_mot_de_passe ```

## Commande pour se connecter à un docker redis : 

``` docker exec -it ID redis-cli```

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


## Commande pour voir les informations stockées:

Comme dit plus haut, redis utilise un système de clé valeur donc pour voir les données. Donc pour voir les données stockées, il faut regarder les clées.

Commande pour voir les clées :

```KEYS *```
Commande pour voir les types des clées :

```TYPE key_name```

Commande pour voir la valeur des clées :

Attention cette commande change en fonction des types de clées. Dans notre cas avec chirpstack, les clées ont comme valeur Hash. Donc on utilise la commande suivante :

```HGETALL key_name```

## Utilisation de la base redis par Chirpstack :

Chirspstack utilise redis pour stocker des donnés temporaires qui sont nécessaire à son fonctionnement. On retrouvve par exemple des informations sur la Gateway Lorawan. On retrouve les métrics exit


![image](https://github.com/user-attachments/assets/b4bf7963-df89-4668-890b-bdf0b75092a9)


## Pour plus d'information sur le fonctionnement de la base redis :

[Lien vers le site de Ionos](https://www.ionos.fr/digitalguide/hebergement/aspects-techniques/redis-tutoriel/)

