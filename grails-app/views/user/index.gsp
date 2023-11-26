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

        <div id="layoutSidenav_content"style="width: 1100px">
                    <div class="card mb-5">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Users
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <g:each in="${User.list()}" var="user">
                                    <tr>
                                        <th scope="row">${user.id}</th>
                                        <td>
                                            <g:link controller="user" action="show" id="${user.id}">
                                            %{--${user.username}--}%
                                                <g:fieldValue bean="${user}" field="username" />
                                            </g:link>
                                        </td>
                                        <td>
                                            <g:fieldValue bean="${user}" field="email" />
                                        </td>
                                        <td>${user.getAuthorities()*.authority.join(', ')}</td>
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
