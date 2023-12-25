<%@ page import="fr.bihar.esante.Consultation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <asset:stylesheet href="styles.css"></asset:stylesheet>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <asset:javascript src="datatables-simple-demo.js"/>
</head>
    <body>


    <div id="layoutSidenav_content" style="padding-left:20px;padding-right: 20px">
        <div class="card mb-5">
            <div class="card-header">
                <div class="row">
                        <div class="col-6">
                            <g:link class="btn btn-outline-secondary" action="create" resource="${this.consultation}">
                                <i class="fas fa-table me-1"></i>
                                <g:message code="default.button.create.label" default="Create" />
                            </g:link>
                        </div>


                    <div class="col-6">
                        Toutes les consultations
                    </div>
                </div>
            </div>

            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>N</th>
                        <th>Prénom</th>
                        <th>Nom</th>
                        <th>Description</th>
                        <th>Pathologies</th>
                        <th>Date de consultation</th>


                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${Consultation.list()}" var="consultation">
                        <tr>
                            <th scope="row">${consultation.id}</th>
                            <td>
                                <g:link controller="consultation" action="show" id="${consultation.id}">
                                %{--${user.username}--}%
                                    <g:fieldValue bean="${consultation.carnet}" field="fname" />
                                </g:link>
                            </td>
                            <td>
                                <g:fieldValue bean="${consultation.carnet}" field="lname" />
                            </td>
                            <td>
                                <g:fieldValue bean="${consultation.note}" field="description" />
                            </td>
                            <td>
                            <g:each in="${consultation.pathologies}" var="pathology" status="i">
                                ${pathology.name}
                                <!-- Add a comma and space after each pathology, except for the last one -->
                                <g:if test="${i + 1 < consultation.pathologies.size()}">, </g:if>
                            </g:each>
                            </td>
                            <td>
                                ${consultation.dateCreated?.format('dd-MM-yyyy')}
                            </td>



                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>


        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>

    </body>
</html>