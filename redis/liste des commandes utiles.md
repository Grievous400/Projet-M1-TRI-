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

## Utiliser Redis Insight :

Il existe un logiciel disponible sur plusieurs formats comme docker, desktop et kubernetes.

Voici le lien de la documentation avec tous les liens de téléchargements :
https://redis.io/docs/latest/operate/redisinsight/install/install-on-desktop/

Voici le lien pour le télécharger en version desktop :
https://redis.io/insight/?utm_source=redisinsight&utm_medium=website&utm_campaign=install_redisinsight#insight-form

Une fois l'application téléchargée, on la lance et nous allons ajouter notre base redis 
![image](https://github.com/user-attachments/assets/36b8b531-9d13-48f6-94ad-5e8990bfd94e)

On va ajouter notre base redis pour se faire on va appuyer sur ajouter une base 

![image](https://github.com/user-attachments/assets/e1642b53-c069-4880-be3a-c74e52fb824d)

Pour finir on test la connexion en appuyant sur "Test Connection"
![image](https://github.com/user-attachments/assets/0e775846-661c-4cd0-b165-0c3bcc1628f9)

En cliquant sur notre base ajoutée, on peut voir toutes les clés de cette dernière
![image](https://github.com/user-attachments/assets/38e802e7-422b-464a-84f7-012e2eba4d95)


## Pour plus d'information sur le fonctionnement de la base redis :

[Lien vers le site de Ionos](https://www.ionos.fr/digitalguide/hebergement/aspects-techniques/redis-tutoriel/)

