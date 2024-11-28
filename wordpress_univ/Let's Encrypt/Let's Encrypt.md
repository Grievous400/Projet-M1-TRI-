
# Projet WordPress avec Reverse Proxy Traefik

Cette partie du projet perment d'obtenir des certificats pour nos dockers wordpress.

### 1. Instances WordPress

On doit rajouter ces deux lignes dans la configuration de nos dockers wordpress :

```
labels:
      - "traefik.http.routers.wordpress1.entrypoints=web,websecure"
      - "traefik.http.routers.wordpress1.tls.certresolver=myresolver"
```

traefik.http.routers.wordpress1.entrypoints=web,websecure 
Active l'accès au service via HTTP (port 80) et HTTPS (port 443).

traefik.http.routers.wordpress1.tls.certresolver=myresolver :
Configure le résolveur myresolver pour obtenir un certificat HTTPS via Let's Encrypt.

## 2.Configuration de Traefik et des Certificats HTTPS

### Fonctionnement de Traefik
- La gestion des certificats SSL/TLS pour sécuriser les connexions HTTPS grâce à Let's Encrypt.

Dans ce projet, Traefik est configuré pour :
- Écouter sur les ports 80 (HTTP) et 443 (HTTPS). Si le port 443 est fermé, on n'obtient pas de certificat Let's Encrypt. 
- Gérer deux domaines distincts : `claudel-tri.usmb-tri.fr` et `durand-tri.usmb-tri.f`.
- Obtenir automatiquement des certificats SSL/TLS via Let's Encrypt.

### Configuration des Certificats SSL/TLS
#### Résolveur de Certificat
Le résolveur `myresolver` est utilisé pour obtenir les certificats auprès de Let's Encrypt. Il est configuré dans les options suivantes :
- **`tlschallenge=true`** : Utilise le challenge TLS-ALPN pour valider les domaines.
- **`email`** : Adresse e-mail utilisée pour enregistrer les certificats.
- **`storage`** : Les certificats et clés sont stockés dans le fichier `acme.json`, situé dans le dossier `letsencrypt`.

Le contenu du fichier acme.json est composé des informations sur notre resolveur, la clé privé et les certificats chacun suivis de sa clé publique.  

#### Mode de Test (Staging)
Pour éviter de dépasser les limites de requêtes de Let's Encrypt pendant les tests, le serveur de staging est utilisé :

**`--certificatesresolvers.myresolver.acme.caServer=https://acme-staging-v02.api.letsencrypt.org/directory`**


Il ne faut pas utiliser l'adresse du serveur de staging en production car ce sont des certificats non-signé. Pour une infrasturcture de production, il faut utiliser cette adresse : https://acme-v02.api.letsencrypt.org/directory
Le nombre de requêtes max dépend du type de certificat demandé. Pour plus d'information, il faut regardé sur la doc officielle https://letsencrypt.org/docs/rate-limits/. 


**On peut vérifier la présence de nos certificats de la manière suivante**

Pour voir si nos certificats sont bien généré, on peut aller voir les certificats directement depuis notre navigateurs avec l'adresse en https https://claudel-tri.usmb-tri.fr/ 

Dans notre cas, le certificat apparait non valide car il n'est pas signé. Cela vient du fait qu'on utilise le staging server. Nous pouvons voir les différents éléments de notre certificat.
![image](https://github.com/user-attachments/assets/22aed5f8-97ea-4bcd-8664-44e95cf1ab9f)



### Volumes
- `./letsencrypt` : Stockage des certificats Let's Encrypt.
