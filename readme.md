# eHealth

eHealth est une application grails simple et intuitive qui permet lagestion d'un centre de santé. Elle permet plus précisement de gérer plusieurs utilisateurs de façon fluide et des des dossiers patients, des consultations et leurs illustrations.

Dans la suite nous présenterons les deux grands modules de eHealth, son Backend et son API.

- [Généralité](#généralité)
- [Backend](#backend)
  - [Authentification](#authentification)
  - [Rôles et Utilisateurs](#rôles-et-utilisateurs)
  - [Gestion des utilisateurs](#la-gestion-des-utilisateurs)
  - [Gestion des Carnets](#la-gestion-des-carnets)
  - [Gestion des Consultations](#la-gestion-des-consultation)
- [API](#api)

## Généralité

Globalement eHealth propose les fonctionnalités pour la gestion d'un site de consultation médicale et imposé par le cahier des charges soumis. Ainsi eHealth dispose des fonctionnalités suivantes:

- Opération CRUD sur les utilisateurs, consultations, illustrations, carnet, note et pathologie
- Gestion des utilisateurs : Patient, Médecins, Auxiliaires, Administrateur
- Gestion des consultations : Créer, Attribution et Gestion d'illustration
- Gestion des carnet : Créer, Attribution
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


