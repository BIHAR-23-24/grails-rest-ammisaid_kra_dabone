# Lecoincoin

[Vidéo de démonstration](/demo.mp4)

![Logo](docs/lecoincoin.png)

Lecoincoin est une application grails simple et intuitive qui permet de gérer un site d'annonce. Elle permet plus précisement de gérer plusieurs utilisateurs de façon fluide et des annonces et leurs illustrations.

Dans la suite nous présenterons les deux grands modules de lecoincoin, son Backend et son API.

- [Généralité](#généralité)
- [Backend](#backend)
  - [Authentification](#authentification)
  - [Rôles et Utilisateurs](#rôles-et-utilisateurs)
  - [Gestion des utilisateurs](#la-gestion-des-utilisateurs)
  - [Gestion des annonces](#la-gestion-des-annonces)
  - [Mot de recherche](#le-moteur-de-recherche)
- [API](#api)

## Généralité

Globalement Lecoincoin propose les fonctionnalités pour la gestion d'un site d'annonce et imposé par le cahier des charges soumis. Ainsi Lecoincoin dispose des fonctionnalités suivantes:

- Opération CRUD sur les utilisateurs, annonces et illustrations 
- Gestion des utilisateurs : Client, Modérateur, Administrateur
- Gestion des annonces : Créer, Attribution et Gestion d'illustration
- Gestion des droits d'accès : Chaque utilisateur peut éffectuer un nombre limité d'actions
- API prenant en charge les méthodes GET / POST / PUT / PATCH et DELETE

En plus de ces fonctionnalités, nous avons ajouté **un moteur de recherche** pour la recherche rapide des annonces et insisté sur l'aspect esthétique du Backend. Par exemple par l'usage de photos pour tous utilsateurs.

![Capture Moteur de recherche](docs/moteur-recherche.png)

Les fichiers important à consulter pour la découverte de notre production sont les suivants :

- [Collection Postman de l'API avec documentation](/LECOINCOIN%20CLIENT%20API.postman_collection.json)
- [Documentation PDF de l'API](/ReadMe.pdf)
- [Vidéo de démonstration](/demo.mp4)

## Backend

Le backend de décompose en 4 grandes parties :

- L'authentification
- La gestion des utilisateurs
- La gestion des consultations 
- La gestion des carnets 

### Rôles et Utilisateurs

Les différentes catégories d'utilisateur sont les suivants:

| Utilisateur    | Rôle          | Droits                                                                                                        |
|----------------|---------------|--------------------------------------------------------------------------------------------------------|
| PATIENT         | `ROLE_PATIENT` | Pas d’accès autorisé à la plateforme |
| Médecin      | `ROLE_DOC`    | Connexion, Modification et suppression et consultation de tous les objets sauf les utilisateurs          |
| Auxiliaire    | `ROLE_AUX`    | Connexion, Modification et suppression et consultation de tous les objets sauf les utilisateurs          |
| Administrateur | `ROLE_ADMIN`  | Connexion, Création, Suppression, Modification des utilisateurs et les objets |


### Accueil 

Lors du lancement de l'application, 1 administrateur est créé, 3 médecins sont créés et 3 clients sonts créés dont chacun possède un dossier patient comprend une consultation.

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 04 52" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/576d4bfa-68c4-45a1-b6bb-f1e21cb6678d">



### Authentification

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 05 10" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/fa3a2d0f-fbb0-4455-ae3f-0dc540c98c29">


#### Identifiants

Pour se connecter en tant qu'administrateur il suffit d'utiliser les identifiants suivant :

- Nom utilisateur : admin
- Mot de passe    : admin

Pour se connecter en tant que modérateur il est possible d'utiliser les identifiants suivant :

- Nom utilisateur : moderateur1
- Mot de passe    : password
- 
  Pour se connecter en tant que modérateur il est possible d'utiliser les identifiants suivant :

- Nom utilisateur : client1
- Mot de passe    : password

#### Accésibilité

Lors de la connexion le personnel est redirigé sur une page qui affiche uniquement la listes des carnets des patients. Les autres utilisateurs ont accès à toute l'application dans la limite de leur rôle et droits

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 46 23" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/9b85b8db-abfc-4730-bdd8-cd4063d3c0a2">


### La gestion des utilisateurs

Elle est reservée aux administrateurs dans le sens de la création. L'admin peut consulter les profils des autres utilisateurs. 

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 46 23" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/4967e4e7-dafa-40ac-9677-ef6edf6192e1">

### La gestion des Carnets 

  Create (Créer) : Ajouter une nouvelle entrée dans le carnet avec des détails tels que le nom, l'âge, le numéro de téléphone, etc.
  Read (Lire) : Afficher les détails de toutes les entrées du carnet.
  Update (Mettre à jour) : Modifier les informations d'une entrée existante dans le carnet.
  Delete (Supprimer) : Supprimer une entrée du carnet.

  <img width="1440" alt="Capture d’écran 2024-01-12 à 11 52 31" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/3f5b06f6-2ba6-46b6-8c75-c2dac55e8557">

### La gestion des Carnets 

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 55 28" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/0b835b33-2590-4494-a668-7a3740127a73">

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 55 45" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/a4b87772-3ecb-4b71-9505-a3eb574c463a">



  
### La gestion des Pathologies

  Associer une Pathologie : Ajouter des informations de pathologie associées à une entrée du carnet.
  Consulter les Pathologies : Afficher les informations de pathologie associées à une entrée spécifique du carnet.

  <img width="1440" alt="Capture d’écran 2024-01-12 à 11 53 08" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/e2c9d586-92b6-4ad8-8261-ad0ee4dcec3b">


### La gestion des annonces

Elle permet aux modérateurs de modifier et supprimer les annonces. Seul les administrateurs peuvent en créer et attribuer des annonces à des clients.

![Capture page illustrations annonces](docs/annonces.png)

### Le moteur de recherche

Il permet de rechercher une annonce rapidement à partir de son titre.

## API

l'API possèdent 3 groupes de endpoints :

- `/userApi/user/{id}` Pour l'authentification (Pour l'usage d'un access token)
- `/userApi/consultations` Pour la manipulation des consultations 
- `/userApi/users` Pour la manipulation des utilisateurs


L'explication de l'usage de l'api est présente dans la documentation en pdf ([Documentation PDF de l'API](/ReadMe.pdf)) et les tests et une documentation plus détaillée sont présents dans la collection postman
([Collection Postman de l'API](/LECOINCOIN%20CLIENT%20API.postman_collection.json))

## Bilan

L'objectif était de mettre en place un site de gestion d'annonces en grails ayant un backend et une api pour la gestion des annonces, utilisateurs et illustrations. On peut que l'objectif est a été atteint car nous disposons d'une application grails qui remplie la grande des charges imposée. Et en plus des fonctionnalité de bases nous avons enrichis les utilisateurs en leur ajoutant des photos et ajouté un moteur de recherche d'annonce. Cependant nous n'avons pas pu mettre en place un méchanisme de modification des photos et des mots de passe de utilisateurs ainsi qu'une option pour recherche les clients par leur nom. Malgré cela, nous espérons avoir fournir un travail correspondant suffisamment aux exigences établies.

### Crédits
- Faiçal AMMI SAID
- Souleymane DABONE
- Konan Franck Fabrice KRA




# Objectifs du projet

Vous devez réaliser un projet qui consiste à créer une plateforme qui permettra aux utilisateurs d'enregistrer et suivre leur parcours de santé.

# Les entités

Pour gérer ce projet vous aurez besoin de quelques entités ...

## Utilisateur

Un utilisateur identifié sera capable de s'identifier sur la plateforme et pourra créer renseigner les informations contenues dans son carnet de santé

## Consultation

Les consultations effectuées par le patient pourront être sauvegardées dans le carnet de santé, ces consultations auront un rapport sous forme d'une note et ces notes pourront contenir des illustrations, sous forme de fichiers

## Pathology

Il s'agit d'une simple entité permettant de lister les pathologies qui seront diagnostiquées lors des consultations

## CustomFile

Il s'agit simplement d'une illustration, une image, identifiée par un simple nom de fichier, ce nom de fichier sera utilisé en conjonction avec des chemins stockés dans les fichiers de configuration pour composer le chemin interne (path) et le chemin externe (url)


# Ce qui est attendu

## Backend

Vous devez produire une plateforme permettant de ...
- Créer
- Voir de manière unitaire ou en liste
- Modifier
- Supprimer


... des **Users**, **Consultations** ainsi que des **Pathologies**

Ces pages devront être ergonomiquement respectables, présenter toutes les informations utiles et donner la possibilité de modifier les **Notes** et les **Illustrations** des **Consultations** dans le formulaire de ce dernier

Pour les illustrations, un upload de fichier est attendu

## Api

Vous devrez produire une API REST répondant aux requêtes suivantes :
- GET, PUT, PATCH et DELETE sur /userApi/user/{id}
- GET, POST sur /userApi/users
- GET, PUT, PATCH et DELETE sur /userApi/consultation/{id}
- GET, POST sur /userApi/consultations

Les requêtes seront faites avec un corps en JSON et la réponse pourra être alternativement du JSON ou du XML selon l'encodage demandé lors de l'appel

Les réponses devront retourner les codes d'erreur appropriés accompagnés de messages lorsque le problème n'est pas trivial

### Tests
Vous devrez implémenter une série de tests pour l'API que vous aurez produit, au minimum un test valide et invalide pour chaque point d'entrée

Le format des tests est à votre discrétion (curl, Postman, ...) mais vous devrez les jouer pendant la démonstration

### Documentation

Votre API devra être documentée sur le modèle suivant

#### Get un user

```http
  GET /userApi/user/{id}
```

| Parameter | Type     | Description                         |
| :-------- | :------- |:------------------------------------|
|   `id`    | `string` | **Required**. L'identifiant du user |

# Livraison

La livraison se fera **impérativement** sur un Github Classroom qui vous sera communiqué, la date de rendu sera précisée dans l'assignment que vous rejoindrez, aucune livraison ne sera acceptée par mail ou autre

La livraison contiendra :
- Le code de votre projet
- Un readme clair qui expliquera ce que vous avez fait, ce que vous n'avez pas pu faire et qui donnera des précisions sur le projet (versions utilisées) ainsi que les manipulations à effectuer afin que je puisse faire tourner votre projet sans problème
- La restitution se fera soit sous la forme d'une soutenance soit via une vidéo de démonstration qui respectera un scénario pré-établi qui vous sera transmis.


# Notation

Vous partez d'un capital de 20 points et vous pourrez en perdre pour plusieurs raison :
- Le code est de mauvaise qualité (jusqu'à -5 points)
- L'ergonomie est franchement mauvaise (jusqu'à -3 points)
- Le rendu est franchement mauvais (jusqu'à -3 points)
- Vous n'avez pas fourni de readme avec votre projet (-5 points)
- Vous n'avez pas fourni un des éléments demandés dans la section du dessus (-1 à -5 points par élément)
- Plagiat (-10 à -25 points), vous avez le droit de prendre du code en ligne tant que vous le comprenez mais ne prenez pas le code d'un camarade, la sentence vaut pour les deux groupes

Si vous réalisez des fonctionnalités non demandées, je rajoute des bonus, par exemple :
- Une carte qui présente les points d'intérêt
- Un formulaire d'upload drag & drop en ajax avec preview
- ...



# Readme projet
