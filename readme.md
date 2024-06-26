# eHealth

eHealth est une application grails simple et intuitive qui permet lagestion d'un centre de santé. Elle permet plus précisement de gérer plusieurs utilisateurs de façon fluide et des des dossiers patients, des consultations et leurs illustrations.

Dans la suite nous présenterons les grandes modules de eHealth.

- [Généralité](#généralité)
- [Backend](#backend)
  - [Authentification](#authentification)
  - [Rôles et Utilisateurs](#rôles-et-utilisateurs)
  - [Gestion des utilisateurs](#la-gestion-des-utilisateurs)
  - [Gestion des Carnets](#la-gestion-des-carnets)
  - [Gestion des Consultations](#la-gestion-des-consultations)
- [API](#api)
- [BILAN](#bilan)
- [Crédits](#crédits)


## Généralité

Globalement eHealth propose les fonctionnalités pour la gestion d'un site de consultation médicale et imposé par le cahier des charges soumis. Ainsi eHealth dispose des fonctionnalités suivantes:

- Opération CRUD sur les utilisateurs, consultations, illustrations, carnet, note et pathologie
- Gestion des utilisateurs : Patient, Médecins, Auxiliaires, Administrateur
- Gestion des consultations : Créer, Attribution et Gestion d'illustration
- Gestion des carnet : Créer, Attribution
- Gestion des droits d'accès : Chaque utilisateur peut éffectuer un nombre limité d'actions
- API prenant en charge les méthodes GET / POST / PUT / PATCH et DELETE



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
- Mot de passe    : admin

Pour se connecter en tant que "Doctor" il est possible d'utiliser les identifiants suivant :

- Nom utilisateur : mark
- Mot de passe    : password
- 
  Pour se connecter en tant que "Patient" il est possible d'utiliser les identifiants suivant :

- Nom utilisateur : Rana  
- Mot de passe    : password

Pour se connecter en tant que "Auxiliaire médical" il est possible d'utiliser les identifiants suivant :

- Nom utilisateur : lara  
- Mot de passe    : password

#### Accésibilité

Lors de la connexion le personnel est redirigé sur une page qui affiche uniquement la listes des carnets des patients. Les autres utilisateurs ont accès à toute l'application dans la limite de leur rôle et droits

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 46 23" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/9b85b8db-abfc-4730-bdd8-cd4063d3c0a2">


### La gestion des utilisateurs

Elle est reservée aux administrateurs dans le sens de la création. L'admin peut consulter les profils des autres utilisateurs. 

<img width="1440" alt="Capture d’écran 2024-01-12 à 12 54 59" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/2f6f35e8-9689-40e5-9950-5fa81da0c712">


### La gestion des Carnets 

La gestion des carnets comprend quatre opérations principales : créer, lire, mettre à jour et supprimer des entrées. Pour créer une entrée, ajoutez des détails tels que le nom, l'âge et le numéro de téléphone. La lecture affiche les détails de toutes les entrées. La mise à jour modifie les informations d'une entrée existante, et la suppression retire une entrée du carnet. Ces fonctions offrent un moyen complet de gérer les informations d'un carnet.

  <img width="1440" alt="Capture d’écran 2024-01-12 à 11 52 31" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/3f5b06f6-2ba6-46b6-8c75-c2dac55e8557">

### La gestion des Consultations  

La gestion des consultations comprend les opérations de base (créer, lire, mettre à jour, supprimer) avec une fonctionnalité supplémentaire de sauvegarde de fichiers associés aux consultations. 

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 55 28" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/0b835b33-2590-4494-a668-7a3740127a73">

<img width="1440" alt="Capture d’écran 2024-01-12 à 11 55 45" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/a4b87772-3ecb-4b71-9505-a3eb574c463a">



  
### La gestion des Pathologies

  Associer une Pathologie : Ajouter des informations de pathologie associées à une entrée du carnet.
  Consulter les Pathologies : Afficher les informations de pathologie associées à une entrée spécifique du carnet.

  <img width="1440" alt="Capture d’écran 2024-01-12 à 11 53 08" src="https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/62396414/e2c9d586-92b6-4ad8-8261-ad0ee4dcec3b">

## API

Postman a été utilisé comme client API
Deux Collections créées : Collection API USER, Collection API CONSUTATION

l'API possèdent 3 groupes de endpoints :
- Login  : `/api/user/login` Pour l'authentification (Pour l'usage d'un access token)
  ![image](https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/70859943/55434968-e0a4-4121-9cdb-6b7736894760)
- GET USER :  `/api/user/{id}` Pour recuperer user
  ![image](https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/70859943/5dea73d3-83b5-4136-80c7-16114fe7bf44)
- EDIT USER : `/api/user/{id}` Pour la manipulation des utilisateurs
- EDIT USER PARTIEL : `/api/user/{id}` Pour la manipulation des utilisateurs
- DELETE USER : `/api/user/{id}` Pour la suppression des utilisateurs

Obtenir une consultation : /api/consultation/{id} pour récupérer des informations sur la consultation
![image](https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/70859943/7534bf5a-4b98-41cb-b983-87a2253dffa7)

Modifier une consultation : /api/consultation/{id} pour la gestion des consultations
![image](https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/70859943/1e3730a9-c516-44ec-900a-98c7749de071)

Modifier partiellement une consultation : /api/consultation/{id} pour la gestion partielle des consultations
Supprimer une consultation : /api/consultation/{id} pour la suppression des consultations"
![image](https://github.com/BIHAR-23-24/grails-rest-ammisaid_kra_dabone/assets/70859943/3d247b7c-2a75-4f56-9f40-63d4d6b940be)


## Bilan


- eHealth est une application Grails complète et intuitive conçue pour la gestion efficace des centres de santé dédiés au personnel de niveau administratif, tels que les médecins propriétaires et le Stuff. 

- Le backend et l'API intègrent de manière transparente diverses fonctionnalités, y compris des opérations CRUD sur les utilisateurs, les consultations, etc. en utilisant l'architecture MVC. 

- L'application donne la priorité à la sécurité, avec des rôles et des droits d'accès bien définis (les comptes des médecins peuvent voir certaines fonctionnalités, mais les comptes des patients sont limités).

- Les points forts de l'application sont une interface esthétiquement agréable, une documentation complète, une conception claire de l'API et une architecture MVC. 

Bien que l'application excelle en termes de complexité et de facilité d'utilisation, davantage de détails sur la gestion des annonces et les exigences du système pourraient améliorer la compréhension globale,  En résumé, eHealth se présente comme une solution prometteuse pour rationaliser les opérations des centres de soins de santé.


### Crédits
- Faiçal AMMI SAID
- Souleymane DABONE
- Konan Franck Fabrice KRA


