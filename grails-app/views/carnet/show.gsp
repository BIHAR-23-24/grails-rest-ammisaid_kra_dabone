<%@ page import="fr.bihar.esante.Carnet" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'consultation.label', default: 'Carnet')}" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<!--
        <a href="#show-consultation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-consultation" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<f:display bean="carnet" />
<g:form resource="${this.consultation}" method="DELETE">
    <fieldset class="buttons">
    <g:link class="edit" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
</g:form>
        </div>
        -->

<div id="edit-user" class="content scaffold-edit mt-4" role="main">

    <div class="container">
        <div class="row">
            <!-- First Column -->
            <div class="col-lg-4 col-xlg-3 col-md-5">
                <div class="card" >
                    <div class="card-body">
                        <div class="m-t-30" style="text-align: center;margin-top: 50px">
                            <img src="https://bootdey.com/img/Content/avatar/avatar6.png"
                                 class="img-circle" width="150">
                            <h4 class="card-title m-t-10">${carnet.fname}</h4>

                        </div>

                        <g:form resource="${this.carnet}" method="DELETE">
                            <div class="row mb-3" style="margin: 60px">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <g:link class="btn btn-outline-secondary" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="btn btn-outline-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    </div>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
            <!-- Second Column -->
            <div class="col-lg-8 col-xlg-9 col-md-7">
                <div class="card">
                    <div class="card-footer text-muted d-flex flex-column">
                        <!-- Your existing content goes here -->
                        <strong class="badge bg-secondary mb-2">Prénom 🧑‍⚕️</strong>
                        <p class="text-muted text-center">
                            <strong>${carnet.fname}</strong>
                        </p>

                        <strong class="badge bg-secondary mb-2">Nom 🏥</strong>
                        <p class="text-muted text-center">
                            <strong>${carnet.lname}</strong>
                        </p>

                        <strong class="badge bg-secondary mb-2 p-t-30">Téléphone 📝</strong>
                        <p class="text-muted text-center">
                            <strong>${carnet.tel}</strong>
                        </p>

                        <g:set var="today" value="${java.time.LocalDate.now()}" />
                        <g:set var="birthdate" value="${carnet.dob.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate()}" />
                        <g:set var="age" value="${java.time.Period.between(birthdate, today).getYears()}" />

                        <!-- Display the age -->
                        <strong class="badge bg-secondary mb-2">Age 🎂</strong>
                        <p class="text-muted text-center">
                            <strong>${age}</strong>
                        </p>

                        <strong class="badge bg-secondary mb-2 p-t-30">Poids ⚖️</strong>
                        <p class="text-muted text-center">
                            <strong>${carnet.weight} kgs</strong>
                        </p>

                        <strong class="badge bg-secondary mb-2 p-t-30">Taille 📏</strong>
                        <p class="text-muted text-center">
                            <strong>${carnet.height} mètres</strong>
                        </p>


                        <strong class="badge bg-secondary mb-2 p-t-30">Pathologies 🩹</strong>
                        <p class="text-muted text-center">
                            <strong>
                                <g:each in="${carnet.consultations}" var="consultation">
                                    <g:link controller="consultation" action="show" id="${consultation.id}">
                                        <span>${consultation.note}</span>
                                    </g:link>
                                </g:each>
                            </strong>
                        </p>

                        <br>
                    </div>
                </div>
            </div>

        </div>
        <br>


        <!-- Modal for displaying images -->
        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document"> <!-- Added modal-lg for larger width -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body text-center"> <!-- Center the content -->
                        <img src="" alt="Image Preview" id="imagePreview" class="img-fluid mx-auto">
                    </div>
                </div>
            </div>
        </div>


        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <!-- Include Bootstrap JS (make sure it comes after jQuery) -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            function openImageModal(src) {
                $('#imagePreview').attr('src', src);
                $('#imageModal').modal('show');
            }
        </script>
        <script>
            $(document).ready(function() {
                $('[data-toggle="modal"]').modal();
            });
        </script>




</body>
</html>
