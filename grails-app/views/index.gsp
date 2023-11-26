<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:stylesheet src="stylesAccueil.css"/>
    <title>Hôpital XYZ</title>
</head>
<body>
<header>
    <div class="container">
        <h1>Hôpital XYZ</h1>
        <p>Des soins de qualité à votre service</p>
    </div>
</header>

<section id="hero">
    <div class="container">
        <h2>Bienvenue à l'Hôpital XYZ</h2>
        <p>Offrant des soins exceptionnels depuis 20 ans</p>

        <sec:ifNotLoggedIn>
            <g:link controller="login" action="auth"> <button type="button" class="btn btn-primary">Acceder à l'espace </button></g:link>
        </sec:ifNotLoggedIn>

        <g:link controller='logout'>Logout</g:link>
    </div>
</section>

<section id="services">
    <div class="container">
        <h2>Nos Services</h2>
        <div class="service" onmouseover="animateService(this)" onmouseout="resetAnimation(this)">
            <i class="fas fa-heartbeat"></i>
            <h3>Cardiologie</h3>
            <p>Description du service de cardiologie.</p>
        </div>
        <div class="service" onmouseover="animateService(this)" onmouseout="resetAnimation(this)">
            <i class="fas fa-stethoscope"></i>
            <h3>Médecine Générale</h3>
            <p>Description du service de médecine générale.</p>
        </div>
    </div>
</section>

<section id="doctors">
    <div class="container">
        <h2>Nos Médecins</h2>
        <div class="doctor" onmouseover="animateService(this)" onmouseout="resetAnimation(this)">
            <i class="fas fa-user-md"></i>
            <h3>Dr. Jean Dupont</h3>
            <p>Spécialité : Cardiologie</p>
        </div>
        <div class="doctor" onmouseover="animateService(this)" onmouseout="resetAnimation(this)">
            <i class="fas fa-user-md"></i>
            <h3>Dr. Marie Martin</h3>
            <p>Spécialité : Pédiatrie</p>
        </div>
    </div>
</section>

<section id="contact">
    <div class="container">
        <h2>Contactez-nous</h2>
        <p>Pour prendre rendez-vous ou pour plus d'informations, veuillez nous contacter.</p>
        <a href="tel:+123456789"><i class="fas fa-phone"></i> +1 (234) 567-89</a>
        <p><i class="fas fa-map-marker-alt"></i> 123 Rue de l'Hôpital, Ville, Pays</p>
    </div>
</section>

<footer>
    <div class="container">
        <p>&copy; 2023 Hôpital XYZ. Tous droits réservés.</p>

    </div>
</footer>

<script src="https://kit.fontawesome.com/your-fontawesome-kit-id.js" crossorigin="anonymous"></script>
<script src="scripts.js"></script>
</body>
</html>
