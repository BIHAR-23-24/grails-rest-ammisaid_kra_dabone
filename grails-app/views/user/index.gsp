<%@ page import="fr.bihar.esante.User" %>

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
                                <g:link class="btn btn-outline-secondary" action="create" resource="${this.user}">
                                    <i class="fas fa-table me-1"></i>
                                    <g:message code="default.button.create.label" default="Create" />
                                </g:link>
                            </div>
                            <div class="col-6">
                                All Users
                              </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <table class="table align-middle mb-0 bg-white">
                            <thead class="bg-light">
                            <th scope="row">Name</th>
                            <th scope="row">Email</th>
                            <th scope="row">Role</th>
                            </thead>
                            <g:each in="${User.list()}" var="user">

                                <tr>
                                    <td>
                                        <g:link controller="user" action="show" id="${user.id}" style="color: #007bff; text-decoration: none;">
                                            <g:fieldValue bean="${user}" field="username" />
                                        </g:link>
                                    </td>
                                    <td>
                                        <span style="color: #28a745;">
                                            <g:fieldValue bean="${user}" field="email" />
                                        </span>
                                    </td>
                                    <td style="font-weight: bold;">
                                        ${user.getAuthorities()*.authority.join(', ')}
                                    </td>
                                </tr>
                            </g:each>

                        </table>
                    </div>
                </div>
        </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>

</body>
</html>
