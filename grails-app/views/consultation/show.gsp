<%@ page import="fr.bihar.esante.Consultation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'consultation.label', default: 'Consultation')}" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
    <body>


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
                                    <h4 class="card-title m-t-10">${consultation.carnet.fname}</h4>

                                </div>

                                <g:form resource="${this.consultation}" method="DELETE">
                                    <div class="row mb-3" style="margin: 60px">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <g:link class="btn btn-outline-secondary" action="edit" resource="${this.consultation}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
                                <strong class="badge bg-secondary mb-2">First name 🧑‍⚕️</strong>
                                <p class="text-muted text-center">
                                    <strong>${consultation.carnet.fname}</strong>
                                </p>

                                <strong class="badge bg-secondary mb-2">Last name 🏥</strong>
                                <p class="text-muted text-center">
                                    <strong>${consultation.carnet.lname}</strong>
                                </p>

                                <g:set var="today" value="${java.time.LocalDate.now()}" />
                                <g:set var="birthdate" value="${consultation.carnet.dob.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate()}" />
                                <g:set var="age" value="${java.time.Period.between(birthdate, today).getYears()}" />

                                <!-- Display the age -->
                                <strong class="badge bg-secondary mb-2">Age 🎂</strong>
                                <p class="text-muted text-center">
                                    <strong>${age}</strong>
                                </p>

                                <strong class="badge bg-secondary mb-2 p-t-30">Weight ⚖️</strong>
                                <p class="text-muted text-center">
                                    <strong>${consultation.carnet.weight} kgs</strong>
                                </p>

                                <strong class="badge bg-secondary mb-2 p-t-30">Size 📏</strong>
                                <p class="text-muted text-center">
                                    <strong>${consultation.carnet.height} mètres</strong>
                                </p>

                                <strong class="badge bg-secondary mb-2 p-t-30">Description 📝</strong>
                                <p class="text-muted text-center">
                                    <strong>${consultation.note.description}</strong>
                                </p>

                                <strong class="badge bg-secondary mb-2 p-t-30">Pathologies 🩹</strong>
                                <p class="text-muted text-center">
                                    <strong>
                                        <g:each in="${consultation.pathologies}" var="pathology" status="i">
                                            ${pathology.name}
                                            <!-- Add a comma and space after each pathology, except for the last one -->
                                            <g:if test="${i + 1 < consultation.pathologies.size()}">, </g:if>
                                        </g:each>
                                    </strong>
                                </p>

                                <br>
                            </div>
                        </div>
                    </div>

                </div>
                <br>
                <div class="col-lg-12">
                    <div class="card-footer text-muted d-flex flex-column">


                        <strong class="badge bg-secondary mb-2 p-t-30">Fichiers </strong>

                        <div class="row">
                            <g:each in="${consultation.note.files}" var="file">
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <div class="card-body text-center">
                                        <!-- Check if the file is not null and has an image or SVG extension -->
                                            <g:if test="${file != null && (file.name.toLowerCase().endsWith('.jpg') || file.name.toLowerCase().endsWith('.jpeg') || file.name.toLowerCase().endsWith('.png') || file.name.toLowerCase().endsWith('.svg'))}">
                                                <!-- Use g:resource to generate the URL for the image or SVG -->
                                                <img src="${g.resource(dir: 'images', file: file.name)}" alt="File Image" class="img-fluid mx-auto" style="max-width: 100%; max-height: 200px;"
                                                     onclick="openImageModal('${g.resource(dir: 'images', file: file.name)}')">
                                            </g:if>
                                            <g:else>
                                                <!-- Handle the case where file is null or doesn't have a valid extension -->
                                                File not available or unsupported format
                                            </g:else>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                        </div>

                        <br>
                    </div>
                </div>

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
