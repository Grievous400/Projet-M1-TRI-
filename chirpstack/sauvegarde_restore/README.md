# Localisation des sauvegardes des différents paramètres d'un serveur ChirpStack

Suite à plusieurs tests de restauration des bases Redis et PostgreSQL à l'aide de scripts, nous avons pu identifier la répartition des différents paramètres sauvegardés et leur fonction dans ChirpStack.

## PostgreSQL
La base de données PostgreSQL stocke toutes les informations liées à la configuration du serveur. Voici les éléments principaux qui y sont sauvegardés :
- **Devices**
- **Gateways**
- Paramètres essentiels au fonctionnement du serveur

### Structure de stockage des devices
Les informations sur les devices sont réparties dans les tables suivantes :
- `public.device`
- `public.device_keys`
- `public.device_profile`
- `public.device_profile_template`

Le champ `dev_eui` est une clé étrangère dans toutes ces tables et une clé primaire dans `public.device_keys`.

## Redis
La base de données Redis est utilisée pour stocker les flux de communication.

### Contenu stocké dans Redis
- Trames envoyées par les devices et passant par la gateway
- Messages programmés en downlink

### Particularités
- Lorsque l'on supprime un device dans ChirpStack, les trames présentes dans Redis ne sont pas supprimées. Si le device est rajouté ultérieurement, les anciennes trames sont toujours disponibles.
- En cas d'envoi programmé en downlink, le message est stocké dans Redis en attendant d'être envoyé. Une fois l'heure d'envoi atteinte, ChirpStack recherche le message dans Redis pour l'envoyer.

Ces tests permettent de mieux comprendre la répartition des données dans ChirpStack et de cibler les sauvegardes nécessaires pour une restauration optimale.

