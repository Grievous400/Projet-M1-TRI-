"Ceci est un script qui se connecte à une Base redis d'un chirpstack pour ressortir les trames sous le format protobuf dans un fichier json"
"Ce dernier ne marche pas car il n'arrive pas à décode les trames en protobuf. Il arrive bien à se connecter à la base redis et a ressortir les trames"

import redis
import json
import message_pb2  # Import du fichier généré par Protoc


def connect_to_redis(host, port, username=None, password=None):
    """Se connecter à Redis."""
    try:
        r = redis.StrictRedis(
            host=host,
            port=port,
            username=username,
            password=password,
            decode_responses=False  # Pas de décodage automatique
        )
        r.ping()
        print("Connexion à Redis réussie !")
        return r
    except Exception as e:
        print(f"Erreur de connexion à Redis : {e}")
        return None


def decode_protobuf_message(raw_message):
    """Décoder un message Protobuf brut."""
    try:
        # Initialiser l'objet Protobuf correspondant
        message = message_pb2.UplinkFrame()  # Remplace `YourMessage` par la classe générée
        message.ParseFromString(raw_message)  # Décoder les données brutes
        return json.loads(message.SerializeToString())  # Convertir en dict JSON
    except Exception as e:
        print(f"Erreur lors du décodage. Message brut : {raw_message.hex()}")  # Log en hexadécimal

        print(f"Erreur lors du décodage du message Protobuf : {e}")
        return None


def get_and_decode_messages(redis_client):
    """Récupérer et décoder les messages depuis Redis."""
    try:
        keys = redis_client.keys("gw:*:stream:frame")
        print(f"Clés trouvées : {keys}")

        decoded_messages = []
        for key in keys:
            entries = redis_client.xrange(key, min='-', max='+')
            for entry_id, entry_data in entries:
                for field, value in entry_data.items():
                    decoded_message = decode_protobuf_message(value)
                    if decoded_message:
                        print(decoded_message)
        return decoded_messages
    except Exception as e:
        print(f"Erreur lors de la récupération et du décodage des messages : {e}")
        return []


def save_messages_to_json(messages, output_file):
    """Sauvegarder les messages décodés au format JSON."""
    try:
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(messages, f, indent=4, ensure_ascii=False)
        print(f"Messages sauvegardés dans {output_file}")
    except Exception as e:
        print(f"Erreur lors de la sauvegarde des messages : {e}")


def main():
    redis_host = "127.0.0.1"
    redis_port = 6379
    redis_username = None
    redis_password = "CbnhrqBatcVSMzyuH5ER3x"
    output_file = "decoded_messages.json"
    print(dir(message_pb2))

# Vérifier si "YourMessage" est présent
    if not hasattr(message_pb2, 'YourMessage'):
        print("Le message 'YourMessage' n'est pas défini dans message_pb2.")
    else:
        print("Le message 'YourMessage' est disponible.")

    redis_client = connect_to_redis(redis_host, redis_port, redis_username, redis_password)
    if not redis_client:
        return

    decoded_messages = get_and_decode_messages(redis_client)
    if decoded_messages:
        print(f"Nombre de messages décodés : {len(decoded_messages)}")
        save_messages_to_json(decoded_messages, output_file)
    else:
        print("Aucun message décodé.")


if __name__ == "__main__":
    main()
