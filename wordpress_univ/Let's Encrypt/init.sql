-- Création de la première base de données et utilisateur
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'your_user'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'your_user'@'%';

-- Création de la seconde base de données et utilisateur
CREATE DATABASE IF NOT EXISTS wordpress2;
CREATE USER 'your_user2'@'%' IDENTIFIED BY 'your_password2';
GRANT ALL PRIVILEGES ON wordpress2.* TO 'your_user2'@'%';

FLUSH PRIVILEGES;
