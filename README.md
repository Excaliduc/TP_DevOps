## Question 1-1
### Documentez les éléments essentiels de votre conteneur de base de données: commandes et Dockerfile.

Le Dockerfile pour la base de données PostgreSQL utilise l'image postgres:14.1-alpine comme base. Il définit les variables d'environnement pour le nom de la base de données, l'utilisateur et le mot de passe. Le conteneur est construit avec ces paramètres et démarré sur le réseau app-network. Les scripts SQL pour la création de schéma et l'insertion de données sont exécutés au démarrage.

## Question 1-2
### Pourquoi avons-nous besoin d'une construction à plusieurs étages? Et expliquez chaque étape de ce dockerfile.

La construction à plusieurs étages est utilisée pour réduire la taille de l'image finale. La première étape compile le code Java avec un JDK, et la deuxième étape exécute le code avec un JRE. Cela élimine la nécessité d'avoir un JDK dans l'image finale, réduisant ainsi sa taille et renforçant la sécurité.

## Question 1-3
### Document docker-compose les commandes les plus importantes.

docker-compose up: Démarre les services définis dans le fichier docker-compose.yml.
docker-compose down: Arrête et supprime les services.
docker-compose build: Construit les images des services.
docker-compose ps: Affiche l'état des services.

## Question 1-4
### Documentez votre fichier docker-compose.

Le fichier docker-compose.yml définit trois services: backend, database, et httpd (serveur HTTP). Chaque service a sa propre construction et dépend des autres services. Les services sont tous connectés au réseau my-network. Le service httpd expose le port 80 vers le port 80 de l'hôte.

## Question 1-5
### Documentez vos commandes de publication et les images publiées dans DockerHub.

Pour publier les images sur DockerHub, les étapes sont les suivantes:
Login :```docker login -u excaliduc```

Build des containers :
``` 
docker build -t excaliduc/sql:1.0 -f ./Dockerfile.sql .
docker build -t excaliduc/http:1.0 -f ./Dockerfile.http .
docker build -t excaliduc/api:1.0 -f ./Dockerfile.api .
```  
Push des containers :
```
docker push excaliduc/sql:1.0
docker push excaliduc/http:1.0
docker push excaliduc/api:1.0
```