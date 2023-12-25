<%@ page import="fr.bihar.esante.Carnet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'carnet.label', default: 'Carnet')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <title>Informations Personne</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" integrity="sha512-jCkMv2EJR3C5i5x6lM0VVmWU/zyN1GrAcmZ0y8ePFOK1uyS2pIjyYxgN8DrBY6Br5cuqtaN7i3HF8nLGs5xQrw==" crossorigin="anonymous" />
    <style>

    .person-info {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        animation: animate__fadeIn 1s;
        background-color: #fff; /* Couleur de fond */
        color: #333; /* Couleur du texte */
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .info-item {
        margin-bottom: 15px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        font-weight: bold;
        color: #555; /* Couleur du texte des étiquettes */
        font-size: 18px; /* Taille de police des labels */
    }

    span {
        color: #333; /* Couleur du texte des valeurs */
        cursor: pointer;
        transition: color 0.3s ease-in-out;
        font-size: 16px; /* Taille de police des valeurs */
    }

    .span-hovered {
        color: #3498db; /* Changement de couleur au survol */
    }

    .consultation-list {
        margin-top: 20px;
    }

    .edit-button, .delete-button {
        margin-top: 20px;
        font-size: 16px; /* Taille de police des boutons */
        border-radius: 5px;
        cursor: pointer;
        padding: 10px 15px;
    }

    .edit-button {
        background-color: #87CEEB; /* Couleur bleu ciel */
        color: white;
        border: none;
        margin-right: 10px;
    }

    .edit-button:hover {
        background-color: #3498db; /* Changement de couleur au survol */
    }

    .delete-button {
        background-color: #e74c3c; /* Couleur rouge */
        color: white;
        border: none;
    }

    .delete-button:hover {
        background-color: #c0392b; /* Changement de couleur au survol */
    }

    </style>
    <script>
        // Fonction pour ajouter une classe au survol
        function handleHover(element) {
            element.classList.add("span-hovered");
        }

        // Fonction pour supprimer la classe lorsqu'on quitte le survol
        function handleLeave(element) {
            element.classList.remove("span-hovered");
        }
    </script>
</head>
<body style="
font-family: Arial, sans-serif;
margin: 0;
padding: 0;
box-sizing: border-box;
">

<div class="person-info">

    <h1 style="color: black;">Viewing ${carnet.fname}'s Carnet  </h1>
    <div class="info-item">
        <label>Fname :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.fname}</span>
    </div>
    <div class="info-item">
        <label>Lname :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.lname}</span>
    </div>
    <div class="info-item">
        <label>Dob :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.dob}</span>
    </div>

    <div class="info-item">
        <label>Tel :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.tel}</span>
    </div>
    <div class="info-item">
        <label> Weight :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.weight}</span>
    </div>
    <div class="info-item">
        <label>Height :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.height}</span>
    </div>
    <div class="info-item">
        <label>Blood Type :</label>
        <span onmouseover="handleHover(this)" onmouseleave="handleLeave(this)">${carnet.bloodType}</span>
    </div>

    <div class="consultation-list">
        <div class="info-item">
            <label>Consultations:</label>
        </div>
        <div class="consultation-item">
            <g:each in="${carnet.consultations}" var="consultation">
                <g:link controller="consultation" action="show" id="${consultation.id}">
                    <span>${consultation.note}</span>
                </g:link>
            </g:each>
        </div>
    </div>

    <div class="text-center">
        <td class="action-buttons">
            <g:form resource="${this.carnet}" method="DELETE">
                <button class="edit-button edit" onclick="editCarnet(this)">
                    <g:link class="edit" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </button>

                <input class="delete-button delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

            </g:form>
        </td>
    </div>
</div>

</body>
</html>
