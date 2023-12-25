<%@ page import="fr.bihar.esante.Carnet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <asset:stylesheet href="styles.css"></asset:stylesheet>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <asset:javascript src="datatables-simple-demo.js"/>
</head>
<body>

<div id="layoutSidenav_content"style="padding-left:20px;padding-right: 20px">
    <div class="card mb-5">
        <div class="card-header">
            <div class="row">
                <div class="col-6">
                    <g:link class="btn btn-outline-secondary" action="create" resource="${this.carnet}">
                        <i class="fas fa-table me-1"></i>
                        <g:message code="default.button.create.label" default="Create" />
                    </g:link>
                </div>
                <div class="col-6">
                    All Carnet
                </div>
            </div>
        </div>

        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                <tr>
                    <th>N</th>
                    <th>Fname</th>
                    <th>Lname</th>
                    <th>Dob</th>
                    <th>Tel</th>
                    <th>Weight</th>
                    <th>Height</th>
                    <th>Blood Type</th>
                    <th>Action</th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${Carnet.list()}" var="carnet">
                    <tr>
                        <td scope="row">${carnet.id}</td>
                        <td>
                            <g:link controller="carnet" action="show" id="${carnet.id}">
                            %{--${user.username}--}%
                                <g:fieldValue bean="${carnet}" field="fname" />
                            </g:link>
                        </td>
                        <td>
                            <g:fieldValue bean="${carnet}" field="lname" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="dob" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="tel" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="weight" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="height" />
                        </td>

                        <td>
                            <g:fieldValue bean="${carnet}" field="bloodType" />
                        </td>

                        <td>

                            <g:form resource="${this.carnet}" method="DELETE">
                                <fieldset class="buttons">
                                    <g:link class="edit" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
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
