<%@ page import="fr.bihar.esante.Carnet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'carnet.label', default: 'Carnet')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <title>Informations Personne</title>
    <style>

    .person-info {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .info-item {
        margin-bottom: 15px;
    }

    label {
        display: inline-block;
        width: 100px;
        font-weight: bold;
    }

    span {
        display: inline-block;
        margin-left: 10px;
    }
    </style>
</head>
<body style="
font-family: Arial, sans-serif;
margin: 0;
padding: 0;
box-sizing: border-box;
">

<div class="person-info">
    <h1>Visualisation du Carnet de  <span>${carnet.fname}</span></h1>
    <div class="info-item">
        <label>Fname :</label>
        <span>${carnet.fname}</span>
    </div>
    <div class="info-item">
        <label>Lname :</label>
        <span>${carnet.lname}</span>
    </div>
    <div class="info-item">
        <label>Dob :</label>
        <span>${carnet.dob}</span>
    </div>

    <div class="info-item">
        <label>Tel :</label>
        <span>${carnet.tel}</span>
    </div>
    <div class="info-item">
        <label> Weight :</label>
        <span>${carnet.weight}</span>
    </div>
    <div class="info-item">
        <label>Height :</label>
        <span>${carnet.height}</span>
    </div>
    <div class="info-item">
        <label>Blood Type :</label>
        <span>${carnet.bloodType}</span>
    </div>

    <div class="consultation-list">
        <div class="info-item">
            <label>Consultations:</label>
        </div>
        <div class="consultation-item">
            <g:each in="${carnet.consultations}" var="consultation">
                <g:link controller="consultation" action="show" id="${consultation.id}">
                %{--${user.username}--}%
                    <span>${consultation.note}</span>
                </g:link>
            </g:each>
        </div>
    </div>



    <style>
    .edit-button {
        background-color: #87CEEB; /* Couleur bleu ciel */
        color: white;
    }

    .delete-button {
        background-color: red;
        color: white;
    }
    </style>

    <g:form resource="${this.carnet}" method="DELETE">

        <div class="text-center">
            <td class="action-buttons">
                <button class="edit-button edit" onclick="editCarnet(this)">
                    <g:link class="edit" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </button>

                <input class="delete-button delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </td>
        </div>

    </g:form>



</div>
</div>

</body>
</html>


<g:form resource="${this.carnet}" method="DELETE">

    <td class="action-buttons">

        <button class="delete" onclick="deleteCarnet(this)">
            <g:link   action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ></g:link>
        </button>

        <button class="edit" onclick="editCarnet(this)">
            <g:link class="edit" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        </button>

    </td>
</g:form>



